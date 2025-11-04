//
//  ACSolanaGetAccountInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/10/22.
//

import Foundation

/// A namespace represents informations about the Solana getAccountInfo RPC API .
public enum ACSolanaGetAccountInfo {
    
    /// Name of the getAccountInfo RPC method.
    public static let methodName = "getAccountInfo"
}

extension ACSolanaInteractor {
    
    /// Get all information associated with the account of provided Pubkey.
    /// - Parameters:
    ///   - address: Public key, that is, the account address.
    ///   - optionalParams: Optional params used for the 'getAccountInfo' request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: Associated  account information.
    public func getAccountInfo(pubKey: String,
                               optionalParams: ACSolanaAccountOptionalParams? = nil,
                               rpcAddress: String? = nil,
                               dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> ACSolanaAccountInfo {
        var result: ACSolanaUniRespResult<ACSolanaAccountInfo>
        result = try await callRPCMethod(ACSolanaGetAccountInfo.methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: [pubKey],
                                         pairedParams: [optionalParams],
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
