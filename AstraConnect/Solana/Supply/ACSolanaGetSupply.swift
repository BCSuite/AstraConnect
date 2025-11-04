//
//  ACSolanaGetSupply.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A namespace represents informations about the Solana getSupply  RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getsupply.
public enum ACSolanaGetSupply {
    
    /// Name of the getSupply RPC method.
    public static let methodName = "getSupply"
    
    /// A model represents optional params for the request.
    public struct OptionalParams: Codable {
        
        /// Type description of Configuring State Commitment.
        public var commitment: ACSolanaRPCAPI.StateCommitment?
        
        /// If exclude non circulating accounts list from response.
        public var excludeNonCirculatingAccountsList: Bool?
        
        /// Creating a instance of ACSolanaGetSupply.OptionalParams
        /// - Parameters:
        ///   - commitment: Type description of Configuring State Commitment.
        ///   - excludeNonCirculatingAccountsList: If exclude non circulating accounts list from response.
        public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil, excludeNonCirculatingAccountsList: Bool? = nil) {
            self.commitment = commitment
            self.excludeNonCirculatingAccountsList = excludeNonCirculatingAccountsList
        }
    }
}

extension ACSolanaInteractor {
    
    /// Getting the information about the current supply.
    /// - Parameters:
    ///   - optionalParams: Optional params for the request.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   is ACSolanaReqDataStreamParams.
    /// - Returns: The information about the current supply.
    public func getSupply(optionalParams: ACSolanaGetSupply.OptionalParams? = nil,
                          rpcAddress: String? = nil,
                          dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> ACSolanaSupplyInfo {
        var result: ACSolanaUniRespResult<ACSolanaSupplyInfo>
        result = try await callRPCMethod(ACSolanaGetSupply.methodName,
                                         rpcAddress: rpcAddress,
                                         pairedParams: [optionalParams],
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
