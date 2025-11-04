//
//  ACSolanaGetLatestBlockhash.swift
//  AstraConnect
//
//  Created by scott on 2025/10/30.
//

import Foundation

/// A namespace represents informations about the Solana  'getLatestBlockhash' RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getlatestblockhash.
public enum ACSolanaGetLatestBlockInfo {
    
    /// Name of the getLatestBlockhash RPC method when the Solana-core version is not less than v1.9.
    public static let methodName = "getLatestBlockhash"
    
    /// Name of the getRecentBlockhash RPC method when the Solana-core version is less than v1.9.
    public static let lowCoreVersionMethodName = "getRecentBlockhash"
}

extension ACSolanaInteractor {
    
    /// Getting the latest blockhash and validBlockHeight.
    /// - Parameters:
    ///   - solCoreVersion: The Solana-core version, if it's v1.9 or newer, using the 'getLatestBlockhash' method, otherwise using the
    ///   'getRecentBlockhash' method.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    ///   - optionalParams: Optional params for the request.
    /// - Returns: ACSolanaLatestBlockInfo.
    public func getLatestBlockInfo(solCoreVersion: SolanaCoreVersionKind = .notLessThanV1Dot9,
                                   optionalParams: ACSolanaBasicOptionalParams? = nil,
                                   rpcAddress: String? = nil,
                                   dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> ACSolanaLatestBlockInfo {
        var methodName = ACSolanaGetLatestBlockInfo.methodName
        if solCoreVersion == .lessThanV1Dot9 {
            methodName = ACSolanaGetLatestBlockInfo.lowCoreVersionMethodName
        }
        var result: ACSolanaUniRespResult<ACSolanaLatestBlockInfo>
        result = try await callRPCMethod(methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: nil,
                                         pairedParams: [optionalParams],
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
