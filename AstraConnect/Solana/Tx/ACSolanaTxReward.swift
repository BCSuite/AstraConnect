//
//  ACSolanaTxReward.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//


import Foundation

/// Transaction-level rewards, the official doc is: https://solana.com/docs/rpc/json-structures#token-balances
public struct ACSolanaTxReward: Codable {
    
    /// The public key, as base-58 encoded string, of the account that received the reward.
    public var pubkey: String
    
    /// Number of reward lamports credited or debited by the account, as a i64.
    public var lamports: UInt64
    
    /// Account balance in lamports after the reward was applied.
    public var postBalance: UInt64
    
    /// Type of reward: "fee", "rent", "voting", "staking"
    public var rewardType: String?
    
    /// Vote account commission when the reward was credited, only present for voting and staking rewards.
    public var commission: UInt8?
    
    /// Create a instance of Reward.
    /// - Parameters:
    ///   - pubkey: The public key, as base-58 encoded string, of the account that received the reward.
    ///   - lamports: Number of reward lamports credited or debited by the account, as a i64.
    ///   - postBalance: Account balance in lamports after the reward was applied.
    ///   - rewardType: Type of reward: "fee", "rent", "voting", "staking"
    ///   - commission: Vote account commission when the reward was credited, only present for voting and staking rewards.
    init(pubkey: String,
         lamports: UInt64,
         postBalance: UInt64,
         rewardType: String? = nil,
         commission: UInt8? = nil) {
        self.pubkey = pubkey
        self.lamports = lamports
        self.postBalance = postBalance
        self.rewardType = rewardType
        self.commission = commission
    }
}
