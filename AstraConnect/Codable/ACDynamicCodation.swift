//
//  ACAnyCodable.swift
//  AstraConnect
//
//  Created by scott on 2025/10/23.
//

import Foundation

/// A propertyWrapper supports encode and decode any wrapped codable basic data type.
/// If need decode non-basic decodable type, place it in a Map or Array. Can be used for dynamic usage scenario
/// like one field has different value in different conditions.
@propertyWrapper
public struct ACDynamicCodation: Codable, @unchecked Sendable {
    private static let decodeDebugDesc = "Cann't decode ACDynamicCodation"
    private static let encodeDebugDesc = "Cann't encode ACDynamicCodation"

    public let wrappedValue: Any
    
    public init(_ wrappedValue: Any) {
        self.wrappedValue = wrappedValue
    }
    
    public init(wrappedValue: Any) {
        self.wrappedValue = wrappedValue
    }
   
    public enum CodingKeys: String, CodingKey {
        case wrappedValue
    }
}

// MARK: - Decodable
extension ACDynamicCodation  {
    static let basicDecodableTypes: [Decodable.Type] = [String.self,
                                                        Int.self,
                                                        Int8.self,
                                                        Int16.self,
                                                        Int32.self,
                                                        Int64.self,
                                                        UInt.self,
                                                        UInt8.self,
                                                        UInt16.self,
                                                        UInt32.self,
                                                        UInt64.self,
                                                        Double.self,
                                                        Float.self,
                                                        Float16.self,
                                                        Float32.self,
                                                        Float64.self,
                                                        Bool.self,
                                                        [ACDynamicCodation].self,
                                                        [String: ACDynamicCodation].self,]
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        
        // Null
        if container.decodeNil() {
            wrappedValue = NSNull()
            return
        }
        
        for type in Self.basicDecodableTypes {
            guard let val = try? container.decode(type) else {
                continue
            }
            wrappedValue = val
            return
        }
        
        
        if #available(iOS 18, macOS 15.0, *) {
            // Int128
            if let int128Val = try? container.decode(Int128.self) {
                wrappedValue = int128Val
                return
            }
           
            // [Int128]
            if let int128List = try? container.decode([Int128].self) {
                wrappedValue = int128List
                return
            }
            
            // [String: Int128]
            if let int128Map = try? container.decode([String: Int128].self) {
                wrappedValue = int128Map
                return
            }
            
            // UInt128
            if let uint128Val = try? container.decode(UInt128.self) {
                wrappedValue = uint128Val
                return
            }
            
            // [UInt128]
            if let uint128List = try? container.decode([UInt128].self) {
                wrappedValue = uint128List
                return
            }
            
            // [String: UInt128]
            if let uint128Map = try? container.decode([String: UInt128].self) {
                wrappedValue = uint128Map
                return
            }
        }
        
        throw DecodingError.typeMismatch(
            ACDynamicCodation.self,
            .init(codingPath: container.codingPath, debugDescription: Self.decodeDebugDesc))
    }
}

// MARK: - Encodable
extension ACDynamicCodation {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        guard let encodableValue = wrappedValue as? (any Encodable) else {
            throw DecodingError.typeMismatch(
                type(of: wrappedValue),
                .init(codingPath: container.codingPath, debugDescription: Self.encodeDebugDesc))
        }
        try container.encode(encodableValue)
    }
    
}
