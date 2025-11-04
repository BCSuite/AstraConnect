//
//  ACSolanaGetHealth.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation

/// A namespace represents informations about the Solana getGenesisHash RPC API.
/// The official doc is https://solana.com/docs/rpc/http/gethealth.
public enum ACSolanaGetHealth {
    
    /// Name of the getHealth RPC method.
    public static let methodName = "getHealth"
}

extension ACSolanaInteractor {
    
    /// Getting the current health of the node. A healthy node is one that is within HEALTH_CHECK_SLOT_DISTANCE slots of the latest cluster confirmed slot.
    /// - Parameters:
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: "ok" if the node is healthy.
    public func getHealth(rpcAddress: String? = nil,
                          dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> String {
        try await callRPCMethod(ACSolanaGetHealth.methodName,
                                rpcAddress: rpcAddress,
                                dataStreamParams: dataStreamParams)
    }
}
