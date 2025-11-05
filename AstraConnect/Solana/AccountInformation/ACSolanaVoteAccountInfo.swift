//
//  ACSolanaVoteAccountInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/11/1.
//

import Foundation

/// A model represents the account info and associated stake for all the voting accounts in the current bank.
public struct ACSolanaVoteAccountInfo: Codable, Sendable {
    
    /// The stake, in lamports, delegated to this vote account and active in this epoch.
    public var activatedStake: UInt64
    
    /// Percentage (0-100) of rewards payout owed to the vote account.
    public var commission: Double
    
    /*
     "epochCredits": [
         [902, 1383125544, 1376213656],
         [903, 1390037304, 1383125544],
         [904, 1396949288, 1390037304],
         [905, 1403861272, 1396949288],
         [906, 1406766600, 1403861272]
     ]
     */
    /// Latest history of earned credits for up to five epochs, as an array of arrays containing: [epoch, credits, previousCredits].
    public var epochCredits: [[UInt64]]
    
    /// Whether the vote account is staked for this epoch.
    public var epochVoteAccount: Bool
    
    /// Most recent slot voted on by this vote account.
    public var lastVote: UInt64
    
    /// Validator identity, as base-58 encoded string.
    public var nodePubkey: String
    
    /// Current root slot for this vote account.
    public var rootSlot: UInt64
    
    /// Vote account address, as base-58 encoded string.
    public var votePubkey: String
    
    /// Creating a instance of ACSolanaVoteAccountInfo which  represents the account info and associated stake for all the voting accounts in the current bank.
    /// - Parameters:
    ///   - activatedStake: The stake, in lamports, delegated to this vote account and active in this epoch.
    ///   - commission: Percentage (0-100) of rewards payout owed to the vote account.
    ///   - epochCredits: Latest history of earned credits for up to five epochs, as an array of arrays containing: [epoch, credits, previousCredits].
    ///   - epochVoteAccount: Whether the vote account is staked for this epoch.
    ///   - lastVote: Most recent slot voted on by this vote account.
    ///   - nodePubkey: Validator identity, as base-58 encoded string.
    ///   - rootSlot: Current root slot for this vote account.
    ///   - votePubkey: Vote account address, as base-58 encoded string.
    public init(activatedStake: UInt64,
                commission: Double,
                epochCredits: [[UInt64]],
                epochVoteAccount: Bool,
                lastVote: UInt64,
                nodePubkey: String,
                rootSlot: UInt64,
                votePubkey: String) {
        self.activatedStake = activatedStake
        self.commission = commission
        self.epochCredits = epochCredits
        self.epochVoteAccount = epochVoteAccount
        self.lastVote = lastVote
        self.nodePubkey = nodePubkey
        self.rootSlot = rootSlot
        self.votePubkey = votePubkey
    }
}
