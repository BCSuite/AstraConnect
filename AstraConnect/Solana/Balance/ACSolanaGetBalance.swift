//
//  ACSolanaGetBalance.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// A namespace represents informations about the Solana getBalance RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getbalance.
public enum ACSolanaGetBalance {
    
    /// Name of the getBalance RPC method.
    public static let methodName = "getBalance"
}

extension ACSolanaInteractor {
    
    /// Get current $SOL balance of given pubKey.
    /// - Parameters:
    ///   - pubKey: Public Key(Address).
    ///   - optionalParams: Optional params used for the 'getBalance' request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: Current balance.
    public func getBalance(of pubKey: String,
                           optionalParams: ACSolanaBasicOptionalParams? = nil,
                           rpcAddress: String? = nil,
                           dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> UInt64 {
        let result: ACSolanaUniRespResult<UInt64> = try await callRPCMethod(ACSolanaGetBalance.methodName,
                                                                            rpcAddress: rpcAddress,
                                                                            singleValueParams: [pubKey],
                                                                            dataStreamParams: dataStreamParams)
        return result.value
    }
}
