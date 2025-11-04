//
//  ACSolanaGetClusterNodes.swift
//  AstraConnect
//
//  Created by scott on 2025/10/26.
//

import Foundation

/// A namespace represents informations about the Solana getClusterNodes RPC API.
/// official doc is: https://solana.com/docs/rpc/http/getclusternodes
public enum ACSolanaGetClusterNodes {
    
    /// Method name of the getClusterNodes method.
    public static let methodName = "getClusterNodes"
}

extension ACSolanaInteractor {
    
    /// Getting informatons of  cluster nodes.
    /// - Parameters:
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: Nodes array.
    public func getClusterNodes(rpcAddress: String? = nil,
                                dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> [ACSolanaClusterNode] {
        let methodName = ACSolanaGetClusterNodes.methodName
        return try await self.callRPCMethod(methodName,
                                            rpcAddress: rpcAddress,
                                            singleValueParams: nil,
                                            pairedParams: nil,
                                            dataStreamParams: dataStreamParams)
    }
}
