//
//  ACSolanaGetMultipleAccounts.swift
//  AstraConnect
//
//  Created by scott on 2025/10/30.
//

import Foundation

/// A namespace represents informations about the Solana getMultipleAccounts RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getmultipleaccounts.
public enum ACSolanaGetMultipleAccounts {
    
    /// Name of the getAccountInfo RPC method.
    public static let methodName = "getMultipleAccounts"
}

extension ACSolanaInteractor {
    
    /// Getting the account information for a list of Pubkeys.
    /// - Parameters:
    ///   - pubKeys: An array of Pubkeys to query, as base-58 encoded strings (up to a maximum of 100).
    ///   - optionalParams:  Optional params used for the request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The account information for a list of Pubkeys.
    public func getMultipleAccounts(pubKeys: [String],
                                    optionalParams: ACSolanaAccountOptionalParams? = nil,
                                    rpcAddress: String? = nil,
                                    dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [ACSolanaAccountInfo]? {
        var result: ACSolanaUniRespResult<[ACSolanaAccountInfo]?>
        result = try await callRPCMethod(ACSolanaGetMultipleAccounts.methodName,
                                         rpcAddress: rpcAddress,
                                         listParams: [ACDynamicCodation(pubKeys)],
                                         pairedParams: [optionalParams],
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
