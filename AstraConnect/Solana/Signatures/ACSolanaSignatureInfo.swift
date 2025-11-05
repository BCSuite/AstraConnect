//
//  ACSolanaSignatureInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/*
{
   "signature": "5h6xBEauJ3PK6SWCZ1PGjBvj8vDdWG3KpwATGy1ARAXFSDwt8GFXM7W5Ncn16wmqokgpiKRLuS83KUxyZyv2sUYv",
   "slot": 114,
   "err": null,
   "memo": null,
   "blockTime": null,
   "confirmationStatus": "finalized"
 }
 */
/// A model representst signature informations of confirmed transactions.
/// The official doc is https://solana.com/docs/rpc/http/getsignaturesforaddress.
public struct ACSolanaSignatureInfo: Codable, Sendable {
    
    /// Transaction signature as base-58 encoded string.
    public var signature: String
    
    /// The slot that contains the block with the transaction.
    public var slot: UInt64
    
    /// Error if transaction failed, null if transaction succeeded.
    public var err: ACDynamicCodation?
    
    /// Memo associated with the transaction, null if no memo is present.
    public var memo: String?
    
    /// Estimated production time, as Unix timestamp (seconds since the Unix epoch) of when transaction was processed. null if not available.
    public var blockTime: Int64?
    
    /// The transaction's cluster confirmation status; Either processed, confirmed, or finalized.
    public var confirmationStatus: ACSolanaRPCAPI.StateCommitment?
    
    /// Creating a instance of ACSolanaSignatureInfo which epresentst signature informations of confirmed transactions.
    /// - Parameters:
    ///   - signature: Transaction signature as base-58 encoded string.
    ///   - slot: The slot that contains the block with the transaction.
    ///   - err: Error if transaction failed, null if transaction succeeded.
    ///   - memo: Memo associated with the transaction, null if no memo is present.
    ///   - blockTime: Estimated production time, as Unix timestamp (seconds since the Unix epoch) of when transaction was processed. null if not available.
    ///   - confirmationStatus: The transaction's cluster confirmation status; Either processed, confirmed, or finalized.
    public init(signature: String,
                slot: UInt64,
                err: ACDynamicCodation? = nil,
                memo: String, blockTime: Int64? = nil,
                confirmationStatus: ACSolanaRPCAPI.StateCommitment) {
        self.signature = signature
        self.slot = slot
        self.err = err
        self.memo = memo
        self.blockTime = blockTime
        self.confirmationStatus = confirmationStatus
    }
}
