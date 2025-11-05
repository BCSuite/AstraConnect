//
//  ACSolanaTxStatus.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A model represents the transaction status.
public struct ACSolanaTxStatus: Codable, Sendable {
    
    /// Transaction was successful.
    public var ok: ACDynamicCodation?
    
    /// Transaction failed with TransactionError.
    public var err: ACDynamicCodation?
    
    /// Creating a instance of ACSolanaTxStatus which represents the transaction status.
    /// - Parameters:
    ///   - Ok: Transaction was successful.
    ///   - Err: Transaction failed with TransactionError.
    public init(ok: ACDynamicCodation? = nil, err: ACDynamicCodation? = nil) {
        self.ok = ok
        self.err = err
    }
    
    public enum CodingKeys: CodingKey {
        case Ok
        case Err
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ok = try container.decodeIfPresent(ACDynamicCodation.self, forKey: .Ok)
        self.err = try container.decodeIfPresent(ACDynamicCodation.self, forKey: .Err)
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.ok, forKey: .Ok)
        try container.encodeIfPresent(self.err, forKey: .Err)
    }
}
