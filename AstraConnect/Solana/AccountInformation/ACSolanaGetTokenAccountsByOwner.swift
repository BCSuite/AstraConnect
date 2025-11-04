//
//  ACSolanaGetTokenAccountsByOwner.swift
//  AstraConnect
//
//  Created by scott on 2025/11/1.
//

import Foundation

// A namespace represents informations about the Solana getTokenAccountsByOwner RPC API.
/// The official doc is https://solana.com/docs/rpc/http/gettokenaccountsbyowner.
public enum ACSolanaGetTokenAccountsByOwner {
    
    /// Name of the getTokenAccountsByOwner RPC method.
    public static let methodName = "getTokenAccountsByOwner"
    
}

extension ACSolanaInteractor {
    
    /// Getting all SPL Token accounts by token owner.
    /// - Parameters:
    ///   - delegateAcct: Pubkey of account owner to query, as base-58 encoded string
    ///   - ownershipParams: Ownership related of the account like programId.
    ///   - optionalParams: Optional params for the request, including commitment, encoding etc.
    ///   The encoding type only supports 'base58', 'base64', 'base64+zstd', 'jsonParsed'.
    ///
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    ///
    /// - Returns: All SPL Token accounts by token owner.
    public func getTokenAccountsByOwner(owner: String,
                                        ownershipParams: ACSolanaTokenAccountOwnershipParams,
                                        optionalParams: ACSolanaAccountOptionalParams? = nil,
                                        rpcAddress: String? = nil,
                                        dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [ACSolanaProgramAccountInfo] {
        var result: ACSolanaUniRespResult<[ACSolanaProgramAccountInfo]>
        result = try await callRPCMethod(ACSolanaGetTokenAccountsByOwner.methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: [owner],
                                         pairedParams: [ownershipParams, optionalParams],
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
