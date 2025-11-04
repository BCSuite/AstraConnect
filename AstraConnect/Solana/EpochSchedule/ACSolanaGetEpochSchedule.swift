//
//  ACSolanaGetEpochSchedule.swift
//  AstraConnect
//
//  Created by scott on 2025/10/28.
//

import Foundation

/// A namespace represents informations about the Solana getEpochSchedule RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getepochschedule.
public enum ACSolanaGetEpochSchedule {
    
    /// Name of the getEpochSchedule RPC method.
    public static let methodName = "getEpochSchedule"
}

extension ACSolanaInteractor {
    
    /// Getting the epoch schedule information from this cluster.
    /// - Parameters:
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: ACSolanaEpochScheduleInformation  which represents the data structure of the epoch schedule information from this cluster.
    public func getEpochScheduleInfo(rpcAddress: String? = nil,
                                     dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> ACSolanaEpochScheduleInformation {
        try await callRPCMethod(ACSolanaGetEpochSchedule.methodName,
                                rpcAddress: rpcAddress,
                                dataStreamParams: dataStreamParams)
    }
}
