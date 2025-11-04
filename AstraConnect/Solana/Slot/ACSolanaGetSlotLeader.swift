//
//  ACSolanaGetSlotLeader.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A namespace represents informations about the Solana getSlotLeader  RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getslotleader.
public enum ACSolanaGetSlotLeader {
    
    /// Name of the getSlotLeader RPC method.
    public static let methodName = "getSlotLeader"
}

extension ACSolanaInteractor {
    
    /// Getting the current slot leader.
    /// - Parameters:
    ///   - optionalParams: Optional params for the request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The node identity Pubkey as base-58 encoded string.
    public func getSlotLeader(optionalParams: ACSolanaBasicOptionalParams? = nil,
                              rpcAddress: String? = nil,
                              dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> String {
        try await callRPCMethod(ACSolanaGetSlotLeader.methodName,
                                rpcAddress: rpcAddress,
                                singleValueParams: nil,
                                pairedParams: [optionalParams],
                                dataStreamParams: dataStreamParams)
    }
}
