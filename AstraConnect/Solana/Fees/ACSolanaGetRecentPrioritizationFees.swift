//
//  ACSolanaGetRecentPrioritizationFees.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A namespace represents informations about the Solana getRecentPrioritizationFees RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getrecentprioritizationfees.
public enum ACSolanaGetRecentPrioritizationFees {
    
    /// Name of the getRecentPrioritizationFees RPC method.
    public static let methodName = "getRecentPrioritizationFees"
}

extension ACSolanaInteractor {
    
    ///  Getting a list of prioritization fees from recent blocks.
    /// - Parameters:
    ///   - addresses: An array of Account addresses (up to a maximum of 128 addresses), as base-58 encoded strings. If provided,
    ///   the response will reflect a fee to land a transaction locking all of the provided accounts as writable.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    public func getRecentPrioritizationFees(addresses: [String]? = nil,
                                            rpcAddress: String? = nil,
                                            dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [ACSolanaPrioritizationFeeInfo] {
        var listParams: [ACDynamicCodation]? = nil
        if let addresses = addresses {
            listParams = [ACDynamicCodation(addresses)]
        }
        return try await callRPCMethod(ACSolanaGetRecentPrioritizationFees.methodName,
                                       rpcAddress: rpcAddress,
                                       listParams: listParams,
                                       dataStreamParams: dataStreamParams)
    }
}
