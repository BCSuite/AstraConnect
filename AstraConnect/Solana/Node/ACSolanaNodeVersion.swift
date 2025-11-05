//
//  ACSolanaNodeVersion.swift
//  AstraConnect
//
//  Created by scott on 2025/11/1.
//

import Foundation

/// A model represents the current Solana version running on the node.
public struct ACSolanaNodeVersion: Codable, Sendable {
    
    /// Software version of solana-core.
    public var solanaCore: String
    
    /// Unique identifier of the current software's feature set.
    public var featureSet: UInt32
    
    public enum CodingKeys: String, CodingKey {
        case solanaCore = "solana-core"
        case featureSet = "feature-set"
    }
    
    /// Creating a instance of ACSolanaNodeVersion which represents the current Solana version running on the node.
    /// - Parameters:
    ///   - solanaCore: Software version of solana-core.
    ///   - featureSet: Unique identifier of the current software's feature set.
    public init(solanaCore: String, featureSet: UInt32) {
        self.solanaCore = solanaCore
        self.featureSet = featureSet
    }
}
