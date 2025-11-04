//
//  ACJSONCoder.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// The coder used to code  value of origin type to JSON Data.
public struct ACJSONCoder: ACEncodable {
    public init() {}
    public func encode<T>(_ value: T) throws -> Data where T : Encodable {
        try JSONEncoder().encode(value)
    }
    
}
