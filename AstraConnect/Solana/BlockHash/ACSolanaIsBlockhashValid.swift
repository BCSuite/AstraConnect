//
//  ACSolanaIsBlockhashValid.swift
//  AstraConnect
//
//  Created by scott on 2025/11/2.
//

import Foundation

/// A namespace represents informations about the Solana  'isBlockhashValid' RPC API.
/// The official doc is https://solana.com/docs/rpc/http/isblockhashvalid.
public enum ACSolanaIsBlockhashValid {
    
    /// Name of the isBlockhashValid RPC method when the Solana-core version is not less than v1.9.
    public static let methodName = "isBlockhashValid"
    
    /// Name of the getFees RPC method when the Solana-core version is  less than v1.9.
    public static let lowCoreVersionMethodName = "getFeeCalculatorForBlockhash"
}

extension ACSolanaInteractor {
    
    /// Checking whether a blockhash is still valid or not.
    /// - Returns: Whether a blockhash is still valid or not.
    /// - Parameters:
    ///   - blockhash: The blockhash of the block to evaluate, as base-58 encoded string.
    ///   - optionalParams: Optional params for the request.
    ///   - solCoreVersion:  The Solana-core version, if it's v1.9 or newer, using the 'isBlockhashValid' method, otherwise using the
    /// 'getFeeCalculatorForBlockhash' method.
    ///
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: Whether a blockhash is still valid or not.
    public func checkIsBlockhashValid(blockhash: String,
                                      optionalParams: ACSolanaBasicOptionalParams? = nil,
                                      solCoreVersion: SolanaCoreVersionKind = .notLessThanV1Dot9,
                                      rpcAddress: String? = nil,
                                      dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> Bool {
        var methodName = ACSolanaIsBlockhashValid.methodName
        if solCoreVersion == .lessThanV1Dot9 {
            methodName = ACSolanaIsBlockhashValid.lowCoreVersionMethodName
        }
        var result: ACSolanaUniRespResult<Bool>
        result = try await callRPCMethod(methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: [blockhash],
                                         pairedParams: [optionalParams],
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
