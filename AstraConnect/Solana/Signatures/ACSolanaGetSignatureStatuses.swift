//
//  ACSolanaGetSignatureStatuses.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

public enum ACSolanaGetSignatureStatuses {
    
    /// Name of the getSignatureStatuses RPC method.
    public static let methodName = "getSignatureStatuses"
    
    /// The param key of 'searchTransactionHistory' used for th request.
    public static let searchTxHistoryParamKey = "searchTransactionHistory"
}


extension ACSolanaInteractor {
    
    /// Getting the statuses of a list of signatures. Each signature must be a txid, the first signature of a transaction.
    /// - Parameters:
    ///   - signatures: An array of transaction signatures to confirm, as base-58 encoded strings (up to a maximum of 256).
    ///   - isSearchTxHistory: If a Solana node should search its ledger cache for any signatures not found in the recent status cache.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The statuses of a list of signaturesl, maybe  an [ACSolanaSignatureStatus] or a [nil].
    public func getSignatureStatuses(signatures: [String],
                                     isSearchTxHistory: Bool?,
                                     rpcAddress: String? = nil,
                                     dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [ACSolanaSignatureStatus?]{
        var optParams: [String: Bool]?
        if let isSearchTxHistory = isSearchTxHistory {
            optParams = [ACSolanaGetSignatureStatuses.searchTxHistoryParamKey: isSearchTxHistory]
        }
        var result: ACSolanaUniRespResult<[ACSolanaSignatureStatus?]>
        result = try await callRPCMethod(ACSolanaGetSignatureStatuses.methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: nil,
                                         listParams: [ACDynamicCodation(signatures)],
                                         pairedParams: [optParams],
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
