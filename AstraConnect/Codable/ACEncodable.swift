//
//  ACCodable.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// Code origin type to Data .
public protocol ACEncodable {
    
    /// Code the origin type to Data  .
    /// - Parameters:
    ///   - value: Value of origin type.
    /// - Returns: Byte data.
    func encode<T>(_ value: T) throws -> Data where T : Encodable
}
