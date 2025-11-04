//
//  ACSolanaGetStakeMinimumDelegation.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A namespace represents informations about the Solana getStakeMinimumDelegation  RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getstakeminimumdelegation.
public enum ACSolanaGetStakeMinimumDelegation {
    
    /// Name of the getStakeMinimumDelegation RPC method.
    public static let methodName = "getStakeMinimumDelegation"
}

extension ACSolanaInteractor {
    
    /// Getting  the stake minimum delegation, in lamports.
    /// - Parameters:
    ///   - commitment: Type description of Configuring State Commitment.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The stake minimum delegation, in lamports.
    public func getStakeMinimumDelegation(commitment: ACSolanaRPCAPI.StateCommitment? = nil,
                                          rpcAddress: String? = nil,
                                          dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> UInt64 {
        var pairedParams: [String: String]?
        if let commitment = commitment {
            pairedParams = [ACSolanaRPCAPI.stateCommitmentKey: commitment.rawValue]
        }
        var result: ACSolanaUniRespResult<UInt64>
        result = try await callRPCMethod(ACSolanaGetStakeMinimumDelegation.methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: nil,
                                         pairedParams: [pairedParams],
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
