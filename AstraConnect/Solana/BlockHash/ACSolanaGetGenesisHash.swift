//
//  ACSolanaGetGenesisHash.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation

/// A namespace represents informations about the Solana getGenesisHashRPC API.
/// The official doc is https://solana.com/docs/rpc/http/getgenesishash.
public enum ACSolanaGetGenesisHash {
    
    /// Name of the getGenesisHash RPC method.
    public static let methodName = "getGenesisHash"
}

extension ACSolanaInteractor {
    
    /// Getting the the genesis hash.
    /// - Parameters:
    /// - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    /// - Returns: A Hash as base-58 encoded string.
    public func getGenesisHash(rpcAddress: String? = nil, dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> String {
        try await callRPCMethod(ACSolanaGetGenesisHash.methodName,
                                rpcAddress: rpcAddress,
                                dataStreamParams: dataStreamParams)
    }
}
