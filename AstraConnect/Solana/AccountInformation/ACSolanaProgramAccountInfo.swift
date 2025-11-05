//
//  ACSolanaProgramAccountInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/10/30.
//

import Foundation

/// A model represents account owned by the  given provided program.
public struct ACSolanaProgramAccountInfo: Codable, Sendable {
    
    /// The account Pubkey as base-58 encoded string.
    public var pubkey: String
    
    /// Solana account information.
    public var account: ACSolanaAccountInfo
    
    /// Creating a instance of ACSolanaProgramAccountInfo which represents account owned by the  given provided program.
    /// - Parameters:
    ///   - pubkey: he account Pubkey as base-58 encoded string.
    ///   - account: Solana account information.
    public init(pubkey: String, account: ACSolanaAccountInfo) {
        self.pubkey = pubkey
        self.account = account
    }
}
