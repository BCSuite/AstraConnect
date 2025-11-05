//
//  ACSolanaPrioritizationFeeInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/*
 "prioritizationFee": 0,
  "slot": 418255239
 */
/// A model represents prioritization fee related information.
/// The official is https://solana.com/docs/rpc/http/getrecentprioritizationfees.
public struct ACSolanaPrioritizationFeeInfo: Codable, Sendable {
    
    /// The per-compute-unit fee paid by at least one successfully landed transaction, specified in increments of micro-lamports (0.000001 lamports).
    public var prioritizationFee: UInt64
    
    /// Slot in which the fee was observed.
    public var slot: UInt64
    
    /// Creating a instance of ACSolanaPrioritizationFeeInfo which represents prioritization fee related information.
    /// - Parameters:
    ///   - prioritizationFee: The per-compute-unit fee paid by at least one successfully landed transaction,
    ///   specified in increments of micro-lamports (0.000001 lamports).
    ///   - slot: Slot in which the fee was observed.
    public init(prioritizationFee: UInt64, slot: UInt64) {
        self.prioritizationFee = prioritizationFee
        self.slot = slot
    }
}
