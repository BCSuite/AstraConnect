//
//  ACSolanaGetSlot.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A namespace represents informations about the Solana getSlot  RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getslot.
public enum ACSolanaGetSlot {
    
    /// Name of the getSlot RPC method.
    public static let methodName = "getSlot"
}

extension ACSolanaInteractor {
    
    /// Getting the slot that has reached the given or default commitment level.
    /// - Parameters:
    ///   - optionalParams: Optional params for the request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: The slot that has reached the given or default commitment level.
    public func getSlot(optionalParams: ACSolanaBasicOptionalParams? = nil,
                        rpcAddress: String? = nil,
                        dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> UInt64 {
        try await callRPCMethod(ACSolanaGetSlot.methodName,
                                rpcAddress: rpcAddress,
                                singleValueParams: nil,
                                pairedParams: [optionalParams],
                                dataStreamParams: dataStreamParams)
    }
}
