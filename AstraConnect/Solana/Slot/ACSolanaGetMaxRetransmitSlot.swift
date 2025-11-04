//
//  ACSolanaGetMaxRetransmitSlot.swift
//  AstraConnect
//
//  Created by scott on 2025/10/30.
//

import Foundation

/// A namespace represents informations about the Solana getMaxRetransmitSlot  RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getmaxretransmitslot.
public enum ACSolanaGetMaxRetransmitSlot {
    
    /// Name of the getMaxRetransmitSlot RPC method.
    public static let methodName = "getMaxRetransmitSlot"
}

extension ACSolanaInteractor {
    
    /// Getting the max slot seen from retransmit stage.
    /// - Parameters:
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: the max slot seen from retransmit stage.
    public func getMaxRetransmitSlot(rpcAddress: String? = nil,
                                     dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> UInt64 {
        try await callRPCMethod(ACSolanaGetMaxRetransmitSlot.methodName,
                                rpcAddress: rpcAddress,
                                dataStreamParams: dataStreamParams)
    }
}
