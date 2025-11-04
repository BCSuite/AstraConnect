//
//  ACSolanaGetInflationGovernor.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation

/// A namespace represents informations about the Solana  'getInflationGovernor' RPC API.
///  The official doc is https://solana.com/docs/rpc/http/getinflationgovernor.
public enum ACSolanaGetInflationGovernor {
    
    /// Name of the getInflationGovernor RPC method.
    public static let methodName = "getInflationGovernor"
    
    /// Optional params used for the 'getInflationGovernor' RPC method.
    public struct OptionalParams: Codable {
        
        /// Type description of Configuring State Commitment.
        public var commitment: ACSolanaRPCAPI.StateCommitment
        
        /// Creating a instance of OptionalParams which used for the 'getInflationGovernor' RPC method.
        /// - Parameter commitment: Configuring State Commitment.
        public init(commitment: ACSolanaRPCAPI.StateCommitment) {
            self.commitment = commitment
        }
    }
}

extension ACSolanaInteractor {
    
    /// Getting the informations of the current inflation governor.
    /// - Parameters:
    ///   - optionalParams: Optional params used for the 'getInflationGovernor' request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The ACSolanaInflationGovernor which represents the informations of the current inflation governor.
    public func getInflationGovernor(optionalParams: ACSolanaGetInflationGovernor.OptionalParams? = nil,
                                     rpcAddress: String? = nil,
                                     dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> ACSolanaInflationGovernor {
        try await callRPCMethod(ACSolanaGetInflationGovernor.methodName,
                                rpcAddress: rpcAddress,
                                singleValueParams: nil,
                                pairedParams: [optionalParams],
                                dataStreamParams: dataStreamParams)
        
    }
}
