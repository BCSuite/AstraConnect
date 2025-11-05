//
//  ACSolanaSignatureStatus.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/*
  {
     "slot": 48,
     "confirmations": null,
     "err": null,
     "status": {
       "Ok": null
     },
     "confirmationStatus": "finalized"
   },
 */
/// A model represents the statuses of a Signature.
/// The official doc is https://solana.com/docs/rpc/http/getsignaturestatuses.
public struct ACSolanaSignatureStatus: Codable, Sendable {
    
    /// The slot the transaction was processed.
    public var slot: UInt64
    
    /// Number of blocks since signature confirmation, null if rooted, as well as finalized by a supermajority of the cluster.
    public var confirmations: UInt64?
    
    /// Error if transaction failed, null if transaction succeeded.
    public var err: ACDynamicCodation?
    
    /// Transaction status.
    public var status: ACSolanaTxStatus
    
    /// Type description of Configuring State Commitment.
    public var confirmationStatus: ACSolanaRPCAPI.StateCommitment
    
    /// Creating a instance of ACSolanaSignatureStatus which represents the statuses of a Signature.
    /// - Parameters:
    ///   - slot: The slot the transaction was processed.
    ///   - confirmations: Number of blocks since signature confirmation, null if rooted, as well as finalized by a supermajority of the cluster.
    ///   - err: Error if transaction failed, null if transaction succeeded.
    ///   - status: Transaction status.
    ///   - confirmationStatus: Type description of Configuring State Commitment.
    public init(slot: UInt64,
                confirmations: UInt64? = nil,
                err: ACDynamicCodation? = nil,
                status: ACSolanaTxStatus,
                confirmationStatus: ACSolanaRPCAPI.StateCommitment) {
        self.slot = slot
        self.confirmations = confirmations
        self.err = err
        self.status = status
        self.confirmationStatus = confirmationStatus
    }
}
