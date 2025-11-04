//
//  ACRequestErrorKind.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation


/// Kind of Error for the RPC network interaction process.
public enum ACRPCProcessErrorKind: Int {
    
    /// Invalid request URL.
    case invalidURL
    
    /// The way to send a request is not supported.
    case unknownReqWay
    
    /// Unsupported data type when interacting with chains.
    case unsupportedDataType
    
    /// Non-HTTP response.
    case nonHTTPResponse
     
    /// Exception happend for the URLSessionTask.
    case urlSessionTaskException
    
    /// Not solana RPC response.
    case nonSolanaResponse
    
    /// Fail to decode the response
    case responseDecodeFailed
    
    /// RPC received a request, but can't handle it then response a error.
    case rpcHandleFailed
    
    /// RPC handled the request, but response a nil result.
    case nilResult
    
    /// Response is not Solana JSON RPC Response
    case nonSolJSONRPCResponse
}


extension ACRPCProcessErrorKind {
    public enum Prefixs {
        public static let invalidURL = "invalid URL->"
        public static let unKnownReqWay = "unKnown request way->"
        public static let unsupportedDataType = "unsupported data type->"
    }
    
    /// A table stores related ACError msg prefix of different ACRequestErrorKind
    public static let msgPrefixTable = [ACRPCProcessErrorKind.invalidURL.rawValue: Prefixs.invalidURL,
                                        ACRPCProcessErrorKind.unknownReqWay.rawValue: Prefixs.unKnownReqWay]
    
    /// Searching prefix to describe the error message.
    /// - Returns: Related prefix, empty string will be returned if not exit.
    public func searchMsgPrefix() -> String {
        Self.msgPrefixTable[self.rawValue] ?? ""
    }
    
    
    /// Build a ACError according to self.
    /// - Parameters:
    ///   - module: The entity containing the function that caused the error.
    ///   - function: The corresponding func creates an error.
    /// - Returns: An  ACError.
    public func buildError(entity: String? = nil,
                           function: String = #function,
                           msg: String? = nil) -> ACError<Int, String> {
        let finalMsg = searchMsgPrefix() + (msg ?? "")
        var module = function
        if let entity = entity {
            module = entity + "." + function
        }
        return ACError(module: module,
                       code: self.rawValue,
                       msg: finalMsg)
    }

}
