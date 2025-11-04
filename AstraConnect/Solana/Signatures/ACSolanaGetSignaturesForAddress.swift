//
//  ACSolanaGetSignaturesForAddress.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A namespace represents informations about the Solana getSignaturesForAddress RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getsignaturesforaddress.
public enum ACSolanaGetSignaturesForAddress {
    
    /// Name of the getSignaturesForAddress RPC method.
    public static let methodName = "getSignaturesForAddress"
    
    /// Optional params for the getRecentPrioritizationFees request.
    public struct OptionalParams: Codable {
       
        /// Type description of Configuring State Commitment.
        public var commitment: ACSolanaRPCAPI.StateCommitment?
        
        /// The minimum slot that the request can be evaluated at.
        public var minContextSlot: UInt64?
        
        /// Maximum transaction signatures to return (between 1 and 1,000). Default: 1000.
        public var limit: UInt64?
        
        /// Start searching backwards from this transaction signature. If not provided the search starts from the top of the highest max confirmed block.
        public var before: String?
        
        /// Search until this transaction signature, if found before limit reached.
        public var until: String?
        
        /// Creating a instance of ACSolanaGetSignaturesForAddress.OptionalParams which used for the getRecentPrioritizationFees request.
        /// - Parameters:
        ///   - commitment: ype description of Configuring State Commitment.
        ///   - minContextSlot: The minimum slot that the request can be evaluated at.
        ///   - limit: Maximum transaction signatures to return (between 1 and 1,000). Default: 1000.
        ///   - before: Start searching backwards from this transaction signature. If not provided the search starts from the top of the highest max confirmed block.
        ///   - until: Search until this transaction signature, if found before limit reached.
        public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil,
                    minContextSlot: UInt64? = nil,
                    limit: UInt64? = nil,
                    before: String? = nil,
                    until: String? = nil) {
            self.commitment = commitment
            self.minContextSlot = minContextSlot
            self.limit = limit
            self.before = before
            self.until = until
        }
    }
}

extension ACSolanaInteractor {
    
    /// Getting signatures for confirmed transactions that include the given address in their accountKeys list.
    /// - Parameters:
    ///   - address: Account address as base-58 encoded string.
    ///   - optionalParams: Optional params for the request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: A ACSolanaSignatureInfo list for confirmed transactions.
    public func getSignatures(forAddress address: String,
                              optionalParams: ACSolanaGetSignaturesForAddress.OptionalParams? = nil,
                              rpcAddress: String? = nil,
                              dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [ACSolanaSignatureInfo] {
        try await callRPCMethod(ACSolanaGetSignaturesForAddress.methodName,
                                rpcAddress: rpcAddress,
                                singleValueParams: [address],
                                pairedParams: [optionalParams],
                                dataStreamParams: dataStreamParams)
    }
}
