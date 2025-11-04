//
//  ACSolanaGetVersion.swift
//  AstraConnect
//
//  Created by scott on 2025/11/1.
//

import Foundation

/// A namespace represents informations about the Solana getVersion  RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getversion.
public enum ACSolanaGetVersion {
    
    /// Name of the getVersion RPC method.
    public static let methodName = "getVersion"
}

extension ACSolanaInteractor {
    
    /// Getting the current Solana version running on the node.
    /// - Parameter dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams. 
    /// - Parameter rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    /// - Returns: The current Solana version running on the node.
    public func getVersion(rpcAddress: String? = nil,
                           dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> ACSolanaNodeVersion {
        try await callRPCMethod(ACSolanaGetVersion.methodName,
                                rpcAddress: rpcAddress,
                                dataStreamParams: dataStreamParams)
    }
}
