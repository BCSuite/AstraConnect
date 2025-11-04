//
//  ACSolanaGetFirstAvailableBlock.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation

/// A namespace represents informations about the Solana getFirstAvailableBlock RPC API.
/// official doc is: https://solana.com/docs/rpc/http/getfirstavailableblock.
public enum ACSolanaGetFirstAvailableBlock {
    
    /// Method name of the getFirstAvailableBlock method.
    public static let methodName = "getFirstAvailableBlock"
}

extension ACSolanaInteractor {
    
    /// Getting the slot of the lowest confirmed block that has not been purged from the ledger.
    /// - Parameters:
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The slot of the lowest confirmed block that has not been purged from the ledger.
    public func getFirstAvailableBlock(rpcAddress: String? = nil,
                                       dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> UInt64? {
        try await callRPCMethod(ACSolanaGetFirstAvailableBlock.methodName,
                                rpcAddress: rpcAddress,
                                dataStreamParams: dataStreamParams)
    }
}
