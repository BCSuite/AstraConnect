//
//  ACSolanaGetBlockTime.swift
//  AstraConnect
//
//  Created by scott on 2025/10/26.
//

import Foundation

/// A namespace represents informations about the Solana getBlockTim RPC API.
/// official doc is: https://solana.com/docs/rpc/http/getblocktime
public enum ACSolanaGetBlockTime {
    
    /// The method name of 'GetBlockTime'.
    public static let methodName = "getBlockTime"
}

extension ACSolanaInteractor {
    
    /// Gettibg the  estimated block production time of given block.
    /// - Parameters:
    ///   - blockHeight: Block number, identified by Slot.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: Estimated block production time, as Unix timestamp (seconds since the Unix epoch).
    public func getBlockTime(of blockHeight: UInt64,
                             rpcAddress: String? = nil,
                             dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> UInt64 {
        try await callRPCMethod(ACSolanaGetBlockTime.methodName,
                                rpcAddress: rpcAddress,
                                singleValueParams: [blockHeight],
                                dataStreamParams: dataStreamParams)
    }
}
