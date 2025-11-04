//
//  ACSolanaGetInflationReward.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation

/// A namespace represents informations about the Solana  'getInflationReward' RPC API.
///  The official doc is https://solana.com/docs/rpc/http/getinflationreward.
public enum ACSolanaGetInflationReward {
    
    /// Name of the getInflationReward RPC method.
    public static let methodName = "getInflationReward"
    
    /// Optional configuration params used for the 'getInflationReward' RPC method.
    public struct OptionalParams: Codable {
        
        /// Type description of Configuring State Commitment.
        public var commitment: ACSolanaRPCAPI.StateCommitment?
        
        /// An epoch for which the reward occurs. If omitted, the previous epoch will be used.
        public var epoch: UInt64?
        
        /// The minimum slot that the request can be evaluated at.
        public var minContextSlot: UInt64?
        
        /// Creating a instance of OptionalParams  used for the 'getInflationReward' RPC method.
        /// - Parameters:
        ///   - commitment: Type description of Configuring State Commitment.
        ///   - epoch: An epoch for which the reward occurs. If omitted, the previous epoch will be used.
        ///   - minContextSlot: The minimum slot that the request can be evaluated at.
        public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil,
                    epoch: UInt64? = nil,
                    minContextSlot: UInt64? = nil) {
            self.commitment = commitment
            self.epoch = epoch
            self.minContextSlot = minContextSlot
        }
    }
}

extension ACSolanaInteractor {
    
    /// Getting the inflation / staking reward for a list of addresses for an epoch.
    /// - Parameters:
    ///   - addresses: An array of addresses to query, as base-58 encoded strings.
    ///   - optionalParams: Optional paired params for the request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: An ACSolanaInflationReward? array.
    public func getInflationReward(of addresses: [String]?,
                                   optionalParams: ACSolanaGetInflationReward.OptionalParams? = nil,
                                   rpcAddress: String? = nil,
                                   dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [ACSolanaInflationReward?] {
        var optListParams: [ACDynamicCodation]?
        if let addresses = addresses {
            optListParams = [ACDynamicCodation(addresses)]
        }
        return try await callRPCMethod(ACSolanaGetInflationReward.methodName,
                                       rpcAddress: rpcAddress,
                                       singleValueParams: nil,
                                       listParams: optListParams,
                                       pairedParams: nil,
                                       dataStreamParams: dataStreamParams)
    }
}
