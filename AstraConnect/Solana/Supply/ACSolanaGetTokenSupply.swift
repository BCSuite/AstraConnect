//
//  ACSolanaGetTokenSupply.swift
//  AstraConnect
//
//  Created by scott on 2025/11/1.
//

import Foundation

/// A namespace represents informations about the Solana getTokenSupply  RPC API.
/// The official doc is https://solana.com/docs/rpc/http/gettokensupply.
public enum ACSolanaGetTokenSupply {
    
    /// Name of the getSupply RPC method.
    public static let methodName = "getTokenSupply"
}

extension ACSolanaInteractor {
    
    /// Getting the total supply of an SPL Token type.
    /// - Parameters:
    ///   - tokenAddr: Pubkey of the token Mint to query, as base-58 encoded string.
    ///   - commitment: Type description of Configuring State Commitment.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The total supply of an SPL Token type.
    public func getTokenSupply(tokenAddr: String,
                               commitment: ACSolanaRPCAPI.StateCommitment? = nil,
                               rpcAddress: String? = nil,
                               dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> ACSolanaTokenSupplyInfo {
        var pairedParams: [any Encodable]?
        if let commitment = commitment {
            pairedParams = [[ACSolanaRPCAPI.stateCommitmentKey: commitment.rawValue]]
        }
        var result: ACSolanaUniRespResult<ACSolanaTokenSupplyInfo>
        result = try await callRPCMethod(ACSolanaGetTokenSupply.methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: [tokenAddr],
                                         pairedParams: pairedParams,
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
