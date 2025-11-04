//
//  ACSolanaGetTransactionCount.swift
//  AstraConnect
//
//  Created by scott on 2025/11/3.
//

import Foundation

/// A namespace represents informations about the Solana getTransactionCount RPC API.
/// The official doc is https://solana.com/docs/rpc/http/gettransactioncount.
public enum ACSolanaGetTransactionCount {
    
    /// Name of the getVoteAccounts RPC method.
    public static let methodName = "getTransactionCount"
}

extension ACSolanaInteractor {
    
    /// Getting the current Transaction count from the ledger.
    /// - Parameters:
    ///   - optionalParams: Optional params for the  getTransactionCount request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The current Transaction count from the ledger.
    public func getTransactionCount(optionalParams: ACSolanaBasicOptionalParams? = nil,
                                    rpcAddress: String? = nil,
                                    dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> UInt64 {
        try await callRPCMethod(ACSolanaGetTransactionCount.methodName,
                                rpcAddress: rpcAddress,
                                pairedParams: [optionalParams],
                                dataStreamParams: dataStreamParams)
    }
}
