//
//  Commitments.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//


import Foundation

/// A model repsents commitment informations return by the getBlockCommitment RPC method.
public struct ACSolanaCommitments: Codable, Sendable {
    
    /// Array of u64 integers logging the amount of cluster stake in lamports that has voted on the
    /// block at each depth from 0 to MAX_LOCKOUT_HISTORY.
    public var commitment: [UInt64]?
    
    /// Total active stake, in lamports, of the current epoch.
    public var totalStake: UInt64
    
    /// Creating a instance of Commitments which repsents commitment informations return by the getBlockCommitment RPC method.
    /// - Parameters:
    ///   - commitment: Array of u64 integers logging the amount of cluster stake in lamports that has voted on the
    ///   block at each depth from 0 to MAX_LOCKOUT_HISTORY.
    ///
    ///   - totalStake: Total active stake, in lamports, of the current epoch.
    public init(commitment: [UInt64], totalStake: UInt64) {
        self.commitment = commitment
        self.totalStake = totalStake
    }
}
