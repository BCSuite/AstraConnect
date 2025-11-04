//
//  ACSolanaGetBlockHeight.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//

import Foundation

/// A namespace represents informations about the Solana getBlockHeight API.
/// official doc is: https://solana.com/docs/rpc/http/getblockheight
public enum ACSolanaGetBlockHeight {
    
    /// Method name of the getBlock method.
    public static let methodName = "getBlockHeight"
}

extension ACSolanaInteractor {
    
    /// Get current block height.
    /// - Parameters:
    ///   - optionalParams:  Optional params used for the 'getBlockHeight' request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The current block height of the node.
    public func getCurrentBlockHeight(optionalParams: ACSolanaBasicOptionalParams? = nil,
                                      rpcAddress: String? = nil,
                                      dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> UInt64 {
        try await callRPCMethod(ACSolanaGetBlockHeight.methodName,
                                rpcAddress: rpcAddress,
                                singleValueParams: nil,
                                pairedParams: [optionalParams],
                                dataStreamParams: dataStreamParams)
    }
}
