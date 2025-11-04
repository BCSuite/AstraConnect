//
//  ACSolanaGetFeeForMessage.swift
//  AstraConnect
//
//  Created by scott on 2025/10/28.
//

import Foundation

/// A namespace represents informations about the Solana getFeeForMessage RPC API. This method is only available in solana-core v1.9 or newer. Please use getFees for
/// solana-core v1.8 and below. The official doc is https://solana.com/docs/rpc/http/getfeeformessage.
public enum ACSolanaGetFeeForMessage {
    
    /// Name of the getFeeForMessage RPC method.
    public static let methodName = "getFeeForMessage"
    
    /// Name of the getFees RPC method when the Solana-core version is  less than v1.9.
    public static let lowCoreVersionMethodName = "getFees"
}

extension ACSolanaInteractor {
    
    /// Getting the fee the network will charge for a particular Message.
    /// - Parameters:
    ///   - base64Msg: Base-64 encoded Message.
    ///   - optionalParams: Optional params used for the request.
    ///   - solCoreVersion: The Solana-core version, if it's v1.9 or newer, using the 'getFeeForMessage' method, otherwise using the
    ///   'getFees' method.
    ///
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: Fee, may be nil, corresponding to the message at the specified blockhash.
    public func getFeeForMessage(base64Msg: String,
                                 optionalParams: ACSolanaBasicOptionalParams? = nil,
                                 solCoreVersion: SolanaCoreVersionKind = .notLessThanV1Dot9,
                                 rpcAddress: String? = nil,
                                 dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> UInt64? {
        var methodName = ACSolanaGetFeeForMessage.methodName
        if solCoreVersion == .lessThanV1Dot9 {
            methodName = ACSolanaGetFeeForMessage.lowCoreVersionMethodName
        }
        let result: ACSolanaUniRespResult<UInt64?> = try await callRPCMethod(methodName,
                                                                             rpcAddress: rpcAddress,
                                                                             singleValueParams: [base64Msg],
                                                                             pairedParams: [optionalParams],
                                                                             dataStreamParams: dataStreamParams)
        return result.value
    }
}
