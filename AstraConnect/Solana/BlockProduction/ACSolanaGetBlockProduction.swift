//
//  ACSolanaGetBlockProduction.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//

import Foundation

/// A namespace represents informations about Solana's getBlockProductiont RPC API.
/// official doc is: https://solana.com/docs/rpc/http/getblockproduction
public enum ACSolanaGetBlockProduction {
    
    /// Method name of the getBlock method.
    public static let methodName = "getBlockProduction"
    
    /// The data model represents optional params used for the 'getBlockProduction' RPC method.
    public struct OptionalParams: Encodable {
        
        /// The commitment describes how finalized a block is at that point in time.
        public var commitment: ACSolanaRPCAPI.StateCommitment?
        
        /// Only return results for this validator identity (base-58 encoded).
        public var identity: String?
        
        /// Slot range to return block production for. If not provided, defaults to current epoch.
        public var range: ACSolanaSlotRange?
        
        /// Create a instance of OptionalParams which represents optional params used for the 'getBlockProduction' RPC method.
        /// - Parameters:
        ///   - commitment: The commitment describes how finalized a block is at that point in time.
        ///   - identity: Only return results for this validator identity (base-58 encoded).
        ///   - range: Slot range to return block production for. If not provided, defaults to current epoch.
        public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil,
                    identity: String? = nil,
                    range: ACSolanaSlotRange? = nil) {
            self.commitment = commitment
            self.identity = identity
            self.range = range
        }
    }
}

extension ACSolanaInteractor {
    
    /// Get recent block production information from the current or previous epoch.
    /// - Parameters:
    ///   - optionalParams: Optional params used for the 'getBlockProduction' request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: Recent block production information from the current or previous epoch.
    public func getBlockProduction(optionalParams: ACSolanaGetBlockProduction.OptionalParams? = nil,
                                   rpcAddress: String? = nil,
                                   dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> ACSolanaProduction {
        var result: ACSolanaUniRespResult<ACSolanaProduction>
        result = try await callRPCMethod(ACSolanaGetBlockProduction.methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: nil,
                                         pairedParams: [optionalParams],
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
