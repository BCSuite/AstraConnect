//
//  ACSolanaEpochInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/10/28.
//

import Foundation

/*
 "result": {
     "absoluteSlot": 417677615,
     "blockHeight": 405611349,
     "epoch": 966,
     "slotIndex": 365615,
     "slotsInEpoch": 432000,
     "transactionCount": 16883606616
   }
 */
/// A model represents the information about the current epoch, details are shown above.
/// The offical link is https://solana.com/docs/rpc/http/getepochinfo.
public struct ACSolanaEpochInformation: Codable, Sendable {
    
    /// The current slot.
    public var absoluteSlot: UInt64
    
    /// The current block height.
    public var blockHeight: UInt64
    
    /// The current epoch.
    public var epoch: UInt64
    
    /// The current slot relative to the start of the current epoch.
    public var slotIndex: UInt64
    
    /// Total number of transactions processed without error since genesis.
    public var transactionCount: UInt64?
    
    /// Creating a instance of ACSolanaEpochInformation which represents the information about the current epoch.
    /// - Parameters:
    ///   - absoluteSlot: The current slot.
    ///   - blockHeight: The current block height.
    ///   - epoch: The current epoch.
    ///   - slotIndex: The current slot relative to the start of the current epoch.
    ///   - transactionCount: Total number of transactions processed without error since genesis.
    public init(absoluteSlot: UInt64,
                blockHeight: UInt64,
                epoch: UInt64,
                slotIndex: UInt64,
                transactionCount: UInt64? = nil) {
        self.absoluteSlot = absoluteSlot
        self.blockHeight = blockHeight
        self.epoch = epoch
        self.slotIndex = slotIndex
        self.transactionCount = transactionCount
    }
}
