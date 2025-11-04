//
//  ACDecodable.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation

/// Decode Data to origin type.
public protocol ACDecodable {
    
    /// Decode the decodable Data to related origin type.
    /// - Parameters:
    ///   - type: The origin MetaType of the Data.
    ///   - data: Byte data.
    /// - Returns: origin type.
    func decode<T>(to type: T.Type, from data: Data) throws -> T where T : Decodable
}
