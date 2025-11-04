//
//  ACSolanaGetTokenAccountBalance.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A namespace represents informations about the Solana getTokenAccountBalance RPC API.
/// The official doc is https://solana.com/docs/rpc/http/gettokenaccountbalance.
public enum ACSolanaGetTokenAccountBalance {
    
    /// Name of the getTokenAccountBalance RPC method.
    public static let methodName = "getTokenAccountBalance"
}

extension ACSolanaInteractor {
    
    /// The the token balance of an SPL Token account.
    /// - Parameters:
    ///   - pubKey: Pubkey of Token account to query, as base-58 encoded string.
    ///   - commitment: Type description of Configuring State Commitment.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: An ACSolanaTokenAccountBalance instance which represents the token balance of an SPL Token account.
    public func getTokenAccountBalance(pubKey: String,
                                       commitment: ACSolanaRPCAPI.StateCommitment? = nil,
                                       rpcAddress: String? = nil,
                                       dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> ACSolanaTokenAccountBalance {
        var optParams: [String: String]?
        if let commitment = commitment {
            optParams = [ACSolanaRPCAPI.stateCommitmentKey: commitment.rawValue]
        }
        var result: ACSolanaUniRespResult<ACSolanaTokenAccountBalance>
        result = try await callRPCMethod(ACSolanaGetTokenAccountBalance.methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: [pubKey],
                                         pairedParams: [optParams],
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
