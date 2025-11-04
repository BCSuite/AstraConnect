//
//  ACSolanaEpochSchedule.swift
//  AstraConnect
//
//  Created by scott on 2025/10/28.
//

import Foundation

/*
 "result": {
     "firstNormalEpoch": 0,
     "firstNormalSlot": 0,
     "leaderScheduleSlotOffset": 432000,
     "slotsPerEpoch": 432000,
     "warmup": false
   },
 */
/// A model represents the data structure of the epoch schedule information from this cluster, details are shown as above.
/// The official doc is https://solana.com/docs/rpc/http/getepochschedule.
public struct ACSolanaEpochScheduleInformation: Codable {
    
    /// First normal-length epoch, log2(slotsPerEpoch) - log2(MINIMUM_SLOTS_PER_EPOCH).
    public var firstNormalEpoch: UInt64
    
    /// Minimum number of slots in an epoch, MINIMUM_SLOTS_PER_EPOCH * (2.pow(firstNormalEpoch) - 1).
    public var firstNormalSlot: UInt64
    
    /// The number of slots before beginning of an epoch to calculate a leader schedule for that epoch.
    public var leaderScheduleSlotOffset: UInt64
    
    /// The maximum number of slots in each epoch.
    public var slotsPerEpoch: UInt64
    
    /// Whether epochs start short and grow.
    public var warmup: Bool
    
    /// Creating a instance of ACSolanaEpochScheduleInformation.
    /// - Parameters:
    ///   - firstNormalEpoch: First normal-length epoch, log2(slotsPerEpoch) - log2(MINIMUM_SLOTS_PER_EPOCH).
    ///   - firstNormalSlot: Minimum number of slots in an epoch, MINIMUM_SLOTS_PER_EPOCH * (2.pow(firstNormalEpoch) - 1).
    ///   - leaderScheduleSlotOffset: The number of slots before beginning of an epoch to calculate a leader schedule for that epoch.
    ///   - slotsPerEpoch: he maximum number of slots in each epoch.
    ///   - warmup: Whether epochs start short and grow.
    public init(firstNormalEpoch: UInt64,
                firstNormalSlot: UInt64,
                leaderScheduleSlotOffset: UInt64,
                slotsPerEpoch: UInt64,
                warmup: Bool) {
        self.firstNormalEpoch = firstNormalEpoch
        self.firstNormalSlot = firstNormalSlot
        self.leaderScheduleSlotOffset = leaderScheduleSlotOffset
        self.slotsPerEpoch = slotsPerEpoch
        self.warmup = warmup
    }
}


