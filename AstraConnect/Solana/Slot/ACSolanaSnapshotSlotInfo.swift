//
//  ACSolanaSnapshotSlotInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation

/*
 "full": 100,
  "incremental": 110
 */
/// A model represents the slot informations that the node has snapshots for.
///  The official doc is https://solana.com/docs/rpc/http/gethighestsnapshotslot.
public struct ACSolanaSnapshotSlotInfo: Codable {
    
    /// The highest full snapshot slot.
    public var full: UInt64
    
    /// The highest incremental snapshot slot based on full.
    public var incremental: UInt64?
    
    /// Creating a instance of ACSolanaSnapshotSlotInfo.
    /// - Parameters:
    ///   - full: The highest full snapshot slot.
    ///   - incremental: The highest incremental snapshot slot based on full.
    public init(full: UInt64, incremental: UInt64? = nil) {
        self.full = full
        self.incremental = incremental
    }
}
