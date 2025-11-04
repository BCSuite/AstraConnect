//
//  ACSolanaGetTokenAccountsByDelegate.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A namespace represents informations about the Solana getTokenAccountsByDelegate RPC API.
/// The official doc is https://solana.com/docs/rpc/http/gettokenaccountsbydelegate.
public enum ACSolanaGetTokenAccountsByDelegate {
    
    /// Name of the getTokenAccountsByDelegate RPC method.
    public static let methodName = "getTokenAccountsByDelegate"
}

extension ACSolanaInteractor {
    
    /// Getting all SPL Token accounts by approved Delegate.
    /// - Parameters:
    ///   - delegateAcct: Pubkey of account delegate to query, as base-58 encoded string.
    ///   - ownershipParams: Ownership related of the account like programId.
    ///   - optionalParams: Optional params for the request, including commitment, encoding etc.
    ///   The encoding type only supports 'base58', 'base64', 'base64+zstd', 'jsonParsed'.
    ///
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: All SPL Token accounts by approved Delegate.
    public func getTokenAccountsByDelegate(delegateAcct: String,
                                           ownershipParams: ACSolanaTokenAccountOwnershipParams,
                                           optionalParams: ACSolanaAccountOptionalParams? = nil,
                                           rpcAddress: String? = nil,
                                           dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [ACSolanaProgramAccountInfo] {
        var result: ACSolanaUniRespResult<[ACSolanaProgramAccountInfo]>
        result = try await callRPCMethod(ACSolanaGetTokenAccountsByDelegate.methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: [delegateAcct],
                                         pairedParams: [ownershipParams, optionalParams],
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
