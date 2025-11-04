//
//  ACError.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation

/// Keys for prefix of main partial  in the ACError's description.
public enum ACErrorKeys {
    static let ModuleKey = "Module"
    static let CodeKey = "Code"
    static let MsgKey = "Msg"
}

/// The Error representation.
public struct ACError<Code, Description>: Error, LocalizedError where Code: ExpressibleByIntegerLiteral,
                                                                      Description: ExpressibleByStringLiteral {
    
    /// The module in which generates a error.
    public let module: Description?
    
    /// The detailed error code
    public let code: Code
    
    /// The detailed error message.
    public let msg: Description
    
    /// Converted description with a format:"[Module]:xxx,[Code]:xxx,[Msg]:xxxxx
    public var description: String {
        "[\(ACErrorKeys.ModuleKey)]:\(module ?? ""),[\(ACErrorKeys.CodeKey)]:\(code),[\(ACErrorKeys.MsgKey)]:\(msg)"
    }
    
    public var localizedDescription: String {
        description
    }
    
    public var errorDescription: String? {
        description
    }
    
    public init(module: Description? = nil,
                code: Code,
                msg: Description) {
        self.module = module
        self.code = code
        self.msg = msg
    }
}
