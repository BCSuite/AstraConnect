//
//  ACSolanaGetIdentity.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation

/// A namespace represents informations about the Solana  'getIdentity' RPC API.
///  The official doc is https://solana.com/docs/rpc/http/getidentity.
public enum ACSolanaGetIdentity {
    
    /// Name of the getIdentity RPC method.
    public static let methodName = "getIdentity"
}

extension ACSolanaInteractor {
    
    /// Getting the identity pubkey for the current node.
    /// - Parameters:
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: A ACSolanaNodeIdentity which represents identity informations of current node.
    public func getIdentity(rpcAddress: String? = nil,
                            dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> ACSolanaNodeIdentity {
        try await callRPCMethod(ACSolanaGetIdentity.methodName,
                                rpcAddress: rpcAddress,
                                dataStreamParams: dataStreamParams)
    }
}
