//
//  ACSolanaGetMinimumLedgerSlot.swift
//  AstraConnect
//
//  Created by scott on 2025/11/2.
//

import Foundation

/// A namespace represents informations about the Solana minimumLedgerSlot RPC API.
/// The official doc is https://solana.com/docs/rpc/http/minimumledgerslot.
public enum ACSolanaGetMinimumLedgerSlot {
    
    /// Name of the getSlotLeader RPC method.
    public static let methodName = "minimumLedgerSlot"
}

extension ACSolanaInteractor {
    
    /// Getting the lowest slot that the node has information about in its ledger.
    /// - Parameters:
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The lowest slot that the node has information about in its ledger.
    public func getMinimumLedgerSlot(rpcAddress: String? = nil,
                                     dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> UInt64 {
        try await callRPCMethod(ACSolanaGetMinimumLedgerSlot.methodName,
                                rpcAddress: rpcAddress,
                                dataStreamParams: dataStreamParams)
    }
}
