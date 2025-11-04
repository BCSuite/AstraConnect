//
//  ACSolanaGetSlotLeaders.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A namespace represents informations about the Solana getSlotLeaders  RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getslotleaders.
public enum ACSolanaGetSlotLeaders {
    
    /// Name of the getSlotLeaders RPC method.
    public static let methodName = "getSlotLeaders"
}

extension ACSolanaInteractor {
    
    /// Getting the slot leaders for a given slot range
    /// - Parameters:
    /// - startSlot: Start slot to get.
    /// - limit: Slot limitation, the endSlot = startSlot +  limit.
    /// - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    /// - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The slot leaders for a given slot range.
    public func getSlotLeaders(startSlot: UInt64,
                               limit: UInt64,
                               rpcAddress: String? = nil,
                               dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [String] {
        try await callRPCMethod(ACSolanaGetSlotLeaders.methodName,
                                rpcAddress: rpcAddress,
                                singleValueParams: [startSlot, limit],
                                dataStreamParams: dataStreamParams)
    }
}
