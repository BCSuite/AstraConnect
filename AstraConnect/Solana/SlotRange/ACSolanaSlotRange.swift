//
//  ACSolanaSlotRange.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//

import Foundation

/// A model represents a Slot range for fetching block production.
public struct ACSolanaSlotRange: Codable, Sendable {
    
    /// The first slot to return block production information for (inclusive).
    public var firstSlot: UInt64
    
    /// Last slot to return block production information for (inclusive). If parameter not provided, defaults to the highest slot.
    public var lastSlot: UInt64?

    
    /// Creating a instance of ACSolanaSlotRange which represents a Slot range for fetching block production.
    /// - Parameters:
    ///   - firstSlot: The first slot to return block production information for (inclusive).
    ///   - lastSlot: Last slot to return block production information for (inclusive). If parameter not provided, defaults to the highest slot.
    public init(firstSlot: UInt64, lastSlot: UInt64? = nil) {
        self.firstSlot = firstSlot
        self.lastSlot = lastSlot
    }
}
