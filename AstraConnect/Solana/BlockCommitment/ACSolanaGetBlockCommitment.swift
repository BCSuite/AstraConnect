//
//  ACSolanaGetBlockCommitment.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//

import Foundation

/// A namespace represents informations about the Solana getBlockCommitment RPC API.
/// official doc is: https://solana.com/docs/rpc/http/getblockcommitment
public enum ACSolanaGetBlockCommitment {
    
    /// RPC method name.
    public static let methodName = "getBlockCommitment"
    
}

extension ACSolanaInteractor {
    
    /// Get commitment for particular block.
    /// - Parameters:
    ///   - blockHeight: Block number, identified by Slot.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: Commitments instance.
    public func getBlockCommitment(blockHeight: UInt64,
                                   rpcAddress: String? = nil,
                                   dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> ACSolanaCommitments {
        try await callRPCMethod(ACSolanaGetBlockCommitment.methodName,
                                rpcAddress: rpcAddress,
                                singleValueParams: [blockHeight],
                                dataStreamParams: dataStreamParams)
    }
}
