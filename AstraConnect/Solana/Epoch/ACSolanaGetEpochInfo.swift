//
//  ACSolanaGetEpochInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/10/28.
//

import Foundation

/// A namespace represents informations about the Solana getEpochInfo RPC API.
/// official doc is: https://solana.com/docs/rpc/http/getepochinfo
public enum ACSolanaGetEpochInfo {
    
    /// Method name of the getEpochInfo method.
    public static let methodName = "getEpochInfo"
}

extension ACSolanaInteractor {
    
    /// Getting the information about the current epoch.
    /// - Parameters:
    ///   - optionalParams: Optional params used for the 'getEpochInfo' request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: ACSolanaEpochInformation.
    public func getCurrentEpochInfo(optionalParams: ACSolanaBasicOptionalParams? = nil,
                                    rpcAddress: String? = nil,
                                    dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> ACSolanaEpochInformation {
        try await self.callRPCMethod(ACSolanaGetEpochInfo.methodName,
                                     rpcAddress: rpcAddress,
                                     pairedParams: [optionalParams],
                                     dataStreamParams: dataStreamParams)
    }
}
