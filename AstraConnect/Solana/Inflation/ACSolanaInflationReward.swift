//
//  ACSolanaInflationReward.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation


/// A model represents the the inflation / staking reward of an epoch. The official
/// doc is https://solana.com/docs/rpc/http/getinflationreward
public struct ACSolanaInflationReward: Codable {
    
    /// Epoch for which reward occurred.
    public var epoch: UInt64
    
    /// The slot in which the rewards are effective.
    public var effectiveSlot: UInt64
    
    /// Reward amount in lamports.
    public var amount: UInt64
    
    /// Post balance of the account in lamports.
    public var postBalance: UInt64
    
    /// Vote account commission when the reward was credited.
    public var commission: UInt64?
    
    /// Creating a instance of ACSolanaInflationReward which represents the the inflation / staking reward of an epoch.
    /// - Parameters:
    ///   - epoch: Epoch for which reward occurred.
    ///   - effectiveSlot: The slot in which the rewards are effective.
    ///   - amount: Reward amount in lamports.
    ///   - postBalance: Post balance of the account in lamports.
    ///   - commission: Vote account commission when the reward was credited.
    public init(epoch: UInt64, effectiveSlot: UInt64, amount: UInt64, postBalance: UInt64, commission: UInt64? = nil) {
        self.epoch = epoch
        self.effectiveSlot = effectiveSlot
        self.amount = amount
        self.postBalance = postBalance
        self.commission = commission
    }
    
}
