//
//  ACSolanaLimitedSlotRange.swift
//  AstraConnect
//
//  Created by scott on 2025/10/26.
//

import Foundation


/// A limited Slot range made up with a startSlot and a limited block number, which makee the corresponding endSlot =  startSlot +  limited number.
public struct ACSolanaLimitedSlotRange: Codable {
    
    /// The first slot to return block production information for (inclusive).
    public var startSlot: UInt64
    
    /// Limited offset from the startSlot, corresponding  endSlot =  startSlot +  limited number,  must be no more than 500,000 blocks higher than
    ///  the startSlot if used for the getBlocksWithLimit Method.
    public var limit: UInt64?
    
    /// Creating a instance of ACSolanaSlotRange which represents a Slot range for fetching block production.
    /// - Parameters:
    ///   - startSlot: The first slot to return block production information for (inclusive).
    ///   - limit:Limited offset from the startSlot, corresponding  endSlot =  startSlot +  limited number,  must be
    ///   no more than 500,000 blocks higher than the startSlot.
    public init(startSlot: UInt64, limit: UInt64? = nil) {
        self.startSlot = startSlot
        self.limit = limit
    }
}
