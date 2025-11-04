//
//  ACSolanaRequestAirdrop.swift
//  AstraConnect
//
//  Created by scott on 2025/11/2.
//

import Foundation

/// A namespace represents informations about the Solana requestAirdrop API.
/// The official doc is https://solana.com/docs/rpc/http/requestairdrop.
public enum ACSolanaRequestAirdrop {
    
    /// Name of the getGenesisHash RPC method.
    public static let methodName = "requestAirdrop"
}

extension ACSolanaInteractor {
    
    /// Requesting an airdrop of lamports to a Pubkey.
    /// - Parameters:
    ///   - accountAddress: Pubkey of account to receive lamports, as a base-58 encoded string.
    ///   - amount: Amount of lamports to airdrop.
    ///   - commitment: Type description of Configuring State Commitment.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value
    ///   is ACSolanaReqDataStreamParams.
    ///
    /// - Returns: Transaction Signature of the airdrop, as a base-58 encoded string.
    public func requestAirdrop(accountAddress: String,
                               amount: UInt64,
                               commitment: ACSolanaRPCAPI.StateCommitment? = nil,
                               rpcAddress: String? = nil,
                               dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> String {
        var pairedParams: [any Encodable]?
        if let commitment = commitment {
            pairedParams = [[ACSolanaRPCAPI.stateCommitmentKey: commitment.rawValue]]
        }
        return try await callRPCMethod(ACSolanaRequestAirdrop.methodName,
                                       rpcAddress: rpcAddress,
                                       singleValueParams: [accountAddress, amount],
                                       pairedParams: pairedParams,
                                       dataStreamParams: dataStreamParams)
    }
}
