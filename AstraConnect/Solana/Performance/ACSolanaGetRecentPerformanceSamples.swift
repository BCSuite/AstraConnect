//
//  ACSolanaGetRecentPerformanceSamples.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A namespace represents informations about the Solana getRecentPerformanceSamples  RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getrecentperformancesamples.
public enum ACSolanaGetRecentPerformanceSamples {
    
    /// Name of the getRecentPerformanceSamples RPC method.
    public static let methodName = "getRecentPerformanceSamples"
}

extension ACSolanaInteractor {
    
    /// Getting a list of recent performance samples, in reverse slot order.  Performance samples are taken every 60 seconds and include
    ///  the number of transactions and slots that occur in a given time window.
    /// - Parameters:
    ///   - sampleNum: Number of samples to return (maximum 720).
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: A list of ACSolanaPerformanceSample which represents recent performance sample.
    public func getRecentPerformanceSamples(sampleNum: UInt,
                                            rpcAddress: String? = nil,
                                            dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [ACSolanaPerformanceSample] {
        try await callRPCMethod(ACSolanaGetRecentPerformanceSamples.methodName,
                                    singleValueParams: [sampleNum],
                                    dataStreamParams: dataStreamParams)
    }
}
