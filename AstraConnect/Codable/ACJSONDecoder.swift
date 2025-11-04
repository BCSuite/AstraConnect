//
//  ACJSONDecoder.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation

/// The decoder used to decode JSON Data.
public struct ACJSONDecoder: ACDecodable {
    
    /// Creating a instance of ACJSONDecoder which uses JSONDecoder to decode data.
    public init() {}
    
    /// Decode the decodable Data to related origin type.
    /// - Parameters:
    ///   - type: The origin MetaType of the Data.
    ///   - data: Byte data.
    /// - Returns: origin type.
    public func decode<T>(to type: T.Type, from data: Data) throws -> T where T : Decodable {
        try JSONDecoder().decode(type, from: data)
    }
}
