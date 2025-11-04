//
//  ACSolanaGetBlocks.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//

import Foundation

/// A namespace represents informations about the related Solana RPC APIs of getting blocks.
/// official doc is: https://solana.com/docs/rpc/http/getblocks
public enum ACSolanaGetBlocks {
    
    /// Method name of the getBlocks method.
    public static let methodName = "getBlocks"
    
    /// Method name of the getBlocksWithLimit method.
    public static let limitedMethodName = "getBlocksWithLimit"
    
    
    /*
     {
     "commitment": "finalized"
     }
     */
    /// The data model represents optional params used for the 'getBlocks' RPC method, details are shown as above:
    public struct OptionalParams: Encodable {
        
        /// The commitment describes how finalized a block is at that point in time. Only support ' finalized' and 'confirmed', otherwise
        /// will get a error: Method does not support commitment below 'confirmed'.
        
        public var commitment: ACSolanaRPCAPI.StateCommitment?
        
        /// Creating a instance of OptionalParams which  represents optional params used for the 'getBlocks' RPC method.
        /// - Parameter commitment: The commitment describes how finalized a block is at that point in time.
        public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil) {
            self.commitment = commitment
        }
    }
}

extension ACSolanaInteractor {
    
    /// Getting a list of confirmed blocks between startSlot and either endSlot - if provided, or latest confirmed slot, inclusive. Max range allowed is 500,000 slots.
    /// - Parameters:
    ///   - slotRange: Range between two slots. The endSlot can be omitted, once provided, it must be no more than 500,000 blocks higher than the startSlot.
    ///   - optionalParams: Optional params used for the 'getBlocks' request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: An array of uint64 listing confirmed blocks between startSlot and either endSlot - if provided, or latest confirmed slot,
    /// inclusive. Max range allowed is 500,000 slots.
    public func getBlocks(slotRange: ACSolanaSlotRange,
                          optionalParams: ACSolanaGetBlocks.OptionalParams? = nil,
                          rpcAddress: String? = nil,
                          dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> [UInt64] {
        return try await callRPCMethod(ACSolanaGetBlocks.methodName,
                                       rpcAddress: rpcAddress,
                                       singleValueParams: [slotRange.firstSlot, slotRange.lastSlot],
                                       pairedParams: [optionalParams],
                                       dataStreamParams: dataStreamParams)
    }
    
    /// Getting a list of confirmed blocks starting at the given slot.
    /// - Parameters:
    ///   - limitRange: Range with limited endSlot . The endSlot can be omitted, once provided, it must be no more than 500,000 blocks higher than the startSlot.
    ///   - optionalParams: Optional params used for the 'getBlocksWithLimit' request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: An array of uint64 listing confirmed blocks starting at startSlot for up to limited endSlot blocks, inclusive.
    public func getLimitBlocks(limitRange: ACSolanaLimitedSlotRange,
                               optionalParams: ACSolanaGetBlocks.OptionalParams? = nil,
                               rpcAddress: String? = nil,
                               dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> [UInt64] {
        try await callRPCMethod(ACSolanaGetBlocks.limitedMethodName,
                                rpcAddress: rpcAddress,
                                singleValueParams: [limitRange.startSlot, limitRange.limit],
                                pairedParams: [optionalParams],
                                dataStreamParams: dataStreamParams)
    }
}
