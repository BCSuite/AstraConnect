//
//  ACSolanaTxDetails.swift
//  AstraConnect
//
//  Created by scott on 2025/11/1.
//

import Foundation

/// A model represents the transaction details for a confirmed transaction.
public struct ACSolanaTxDetails: Codable {
    
    /// Estimated production time, as Unix timestamp (seconds since the Unix epoch) of when the transaction was processed. null if not available.
    public var blockTime: UInt64?
    
    /// Transaction status metadata object or null.
    public var meta: ACSolanaTxStatusMetadata?
    
    /// The slot this transaction was processed in.
    public var slot: UInt64
    
    /// The corresponding transaction.
    public var transaction: ACDynamicCodation
    
    /// Transaction version. Undefined if maxSupportedTransactionVersion is not set in request params. May be string or number.
    public var version: ACDynamicCodation?
    
    /// Creating a instance of ACSolanaTxDetails which represents the transaction details for a confirmed transaction.
    /// - Parameters:
    ///   - blockTime: Estimated production time, as Unix timestamp (seconds since the Unix epoch) of when the transaction was processed. null if not available.
    ///   - meta: Transaction status metadata object or null.
    ///   - slot: The slot this transaction was processed in.
    ///   - transaction: The corresponding transaction.
    ///   - version: Transaction version. Undefined if maxSupportedTransactionVersion is not set in request params. May be string or number.
    public init(blockTime: UInt64? = nil,
                meta: ACSolanaTxStatusMetadata? = nil,
                slot: UInt64,
                transaction: ACDynamicCodation,
                version: ACDynamicCodation?) {
        self.blockTime = blockTime
        self.meta = meta
        self.slot = slot
        self.transaction = transaction
        self.version = version
    }
}
