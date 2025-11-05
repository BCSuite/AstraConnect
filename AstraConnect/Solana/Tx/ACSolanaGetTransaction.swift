//
//  ACSolanaGetTransaction.swift
//  AstraConnect
//
//  Created by scott on 2025/11/1.
//

import Foundation

/// A namespace represents informations about the Solana getTransaction RPC API.
/// The official doc is https://solana.com/docs/rpc/http/gettransaction.
public enum ACSolanaGetTransaction {
    
    /// Name of the getTransaction RPC method.
    public static let methodName = "getTransaction"
    
    public struct OptionalParams: Codable, Sendable {
        
        /// Type description of Configuring State Commitment.
        public var commitment: ACSolanaRPCAPI.StateCommitment
        
        /// ** Using ACSolanaRPCAPI.maxSupportedTransactionVersion**. This parameter determines the maximum transaction version
        /// that will be returned in the response. If you request a transaction with a higher version than this value,
        /// an error will be returned. If you omit this parameter, only legacy transactions will be returned—any versioned
        /// transaction will result in an error.
        public var maxSupportedTransactionVersion: UInt64
        
        /// Encoding for filter bytes data, either "base58" or "base64", only supports 'json', 'jsonParsed', 'base64', 'base58'.
        public var encoding: ACSolanaRPCAPI.encodingKind
        
        /// Creating a instance of ACSolanaGetTransaction.OptionalParams used for the request.
        /// - Parameters:
        ///   - commitment: Type description of Configuring State Commitment.
        ///   - maxSupportedTransactionVersion: The maximum transaction version.
        ///   - encoding: Encoding for filter bytes data.
        public init(commitment: ACSolanaRPCAPI.StateCommitment,
                    maxSupportedTransactionVersion: UInt64 = ACSolanaRPCAPI.maxSupportedTransactionVersion,
                    encoding: ACSolanaRPCAPI.encodingKind) {
            self.commitment = commitment
            self.maxSupportedTransactionVersion = maxSupportedTransactionVersion
            self.encoding = encoding
        }
    }
}


extension ACSolanaInteractor {
    
    /// Getting transaction details for a confirmed transaction.
    /// - Parameters:
    ///   - txID: Transaction signature, as base-58 encoded string.
    ///   - optionalParams: Optional params for the request, if the 'encoding' is non-JSON format, detailed transaction will be returned as a bianary string.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: Transaction details for a confirmed transaction.
    public func getTransaction(txID: String,
                               optionalParams: ACSolanaGetTransaction.OptionalParams? = nil,
                               rpcAddress: String? = nil,
                               dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> ACSolanaTxDetails? {
        do {
            return try await callRPCMethod(ACSolanaGetTransaction.methodName,
                                    rpcAddress: rpcAddress,
                                    singleValueParams: [txID],
                                    pairedParams: [optionalParams],
                                    dataStreamParams: dataStreamParams)
        } catch {
            guard let acErr = error as? ACError<Int, String>,
                  acErr.code == ACRPCProcessErrorKind.nilResult.rawValue else {
                throw error
            }
            return nil
        }
    }
}
