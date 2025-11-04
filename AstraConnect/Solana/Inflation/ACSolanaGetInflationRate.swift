//
//  ACSolanaGetInflationRate.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation

/// A namespace represents informations about the Solana  'getInflationRate' RPC API.
///  The official doc is https://solana.com/docs/rpc/http/getinflationrate.
public enum ACSolanaGetInflationRate {
    
    /// Name of getInflationRate RPC method.
    public static let methodName = "getInflationRate"
}

extension ACSolanaInteractor {
    
    /// Getting the specific inflation values for the current epoch.
    /// - Parameters:
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The ACSolanaInflationRate which represents specific inflation values for the current epoch.
    public func getInflationRate(rpcAddress: String? = nil,
                                 dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> ACSolanaInflationRate {
        try await callRPCMethod(ACSolanaGetInflationRate.methodName,
                                rpcAddress: rpcAddress,
                                dataStreamParams: dataStreamParams)
    }
}
