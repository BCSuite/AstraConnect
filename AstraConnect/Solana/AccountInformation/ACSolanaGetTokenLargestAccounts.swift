//
//  ACSolanaGetTokenLargestAccounts.swift
//  AstraConnect
//
//  Created by scott on 2025/11/1.
//

import Foundation

/// A namespace represents informations about the Solana getTokenLargestAccounts RPC API.
/// The official doc is https://solana.com/docs/rpc/http/gettokenlargestaccounts.
public enum ACSolanaGetTokenLargestAccounts {
    
    /// Name of the getAccountInfo RPC method.
    public static let methodName = "getTokenLargestAccounts"
}

extension ACSolanaInteractor {
    
    /// Getting the 20 largest accounts of a particular SPL Token type.
    /// - Parameters:
    ///   - tokenAddr: Pubkey of the token Mint to query, as base-58 encoded string.
    ///   - commitment: Type description of Configuring State Commitment.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The 20 largest accounts of a particular SPL Token type.
    public func getTokenLargestAccounts(tokenAddr: String,
                                        commitment: ACSolanaRPCAPI.StateCommitment? = nil,
                                        rpcAddress: String? = nil,
                                        dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [ACSolanaTokenAccountInfo] {
        var pairedParams: [any Encodable]?
        if let commitment = commitment {
            pairedParams = [[ACSolanaRPCAPI.stateCommitmentKey: commitment.rawValue]]
        }
        var result: ACSolanaUniRespResult<[ACSolanaTokenAccountInfo]>
        result = try await callRPCMethod(ACSolanaGetTokenLargestAccounts.methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: [tokenAddr],
                                         pairedParams: pairedParams,
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
