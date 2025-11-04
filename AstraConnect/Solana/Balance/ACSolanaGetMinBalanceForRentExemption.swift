//
//  ACSolanaGetMinBalanceForRentExemption.swift
//  AstraConnect
//
//  Created by scott on 2025/10/30.
//

import Foundation

/// A namespace represents informations about the Solana getMinimumBalanceForRentExemption RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getbalance.
public enum ACSolanaGetMinBalanceForRentExemption {
    
    /// Name of the getMinimumBalanceForRentExemption RPC method.
    public static let methodName = "getMinimumBalanceForRentExemption"
    
    /// A model represents optional params for the 'getMinimumBalanceForRentExemption' request.
    public struct OptionalParams: Codable {
        
        /// Type description of Configuring State Commitment.
        public var commitment: ACSolanaRPCAPI.StateCommitment
        
        /// Creating a instance of ACSolanaGetMinBalanceForRentExemption.OptionalParams which represents optional
        /// params for the 'getMinimumBalanceForRentExemption' request.
        ///
        /// - Parameter commitment: Type description of Configuring State Commitment.
        public init(commitment: ACSolanaRPCAPI.StateCommitment) {
            self.commitment = commitment
        }
    }
}

public typealias MinBalanceForRentExemptionOptParams = ACSolanaGetMinBalanceForRentExemption.OptionalParams

extension ACSolanaInteractor {
    
    /// Getting the minimum balance required to make account rent exempt.
    /// - Parameters:
    ///   - accountDataLength: The Account's data length.
    ///   - optionalParams: Optional params for the request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The minimum balance required to make account rent exempt.
    public func getMinimumBalanceForRentExemption(accountDataLength: UInt64,
                                                  optionalParams: MinBalanceForRentExemptionOptParams? = nil,
                                                  rpcAddress: String? = nil,
                                                  dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> UInt64 {
        try await callRPCMethod(ACSolanaGetMinBalanceForRentExemption.methodName,
                                rpcAddress: rpcAddress,
                                singleValueParams: [accountDataLength],
                                pairedParams: [optionalParams],
                                dataStreamParams: dataStreamParams)
    }
}
