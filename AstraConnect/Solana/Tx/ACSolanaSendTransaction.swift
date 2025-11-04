//
//  ACSolanaSendTransaction.swift
//  AstraConnect
//
//  Created by scott on 2025/11/2.
//

import Foundation

/// A namespace represents informations about the Solana sendTransaction RPC API.
/// The official doc is https://solana.com/docs/rpc/http/sendtransaction.
public enum ACSolanaSendTransaction {
    
    /// Method name of the sendTransaction method.
    public static let methodName = "sendTransaction"
    
    /// Optional params for the 'sendTransaction' request.
    public struct OptionalParams: Codable {
        
        /// Encoding used for the transaction data, only supports 'base58' and 'base64'.
        public var encoding: ACSolanaRPCAPI.encodingKind?
        
        /// When true, skip the preflight transaction checks. Default: false.
        public var skipPreflight: Bool?
        
        /// Commitment level to use for preflight
        public var preflightCommitment: ACSolanaRPCAPI.StateCommitment?
        
        /// Maximum number of times for the RPC node to retry sending the transaction to the leader. If this parameter not provided, the RPC node will retry the transaction until it is finalized or until the blockhash expires.
        public var maxRetries: UInt?
        
        /// Set the minimum slot at which to perform preflight transaction checks.
        public var minContextSlot: UInt64?
        
        /// Creating a instance of ACSolanaSendTransaction.OptionalParams  for the sendTransaction method.
        /// - Parameters:
        ///   - encoding: Encoding used for the transaction data, only supports 'base58' and 'base64'.
        ///   - skipPreflight: When true, skip the preflight transaction checks. Default: false
        ///   - preflightCommitment: Commitment level to use for preflight.
        ///   - maxRetries: Maximum number of times for the RPC node to retry sending the transaction to the leader.
        ///   If this parameter not provided, the RPC node will retry the transaction until it is finalized or until the blockhash expires.
        ///   - minContextSlot: Set the minimum slot at which to perform preflight transaction checks.
        public init(encoding: ACSolanaRPCAPI.encodingKind? = nil,
                    skipPreflight: Bool? = nil,
                    preflightCommitment: ACSolanaRPCAPI.StateCommitment? = nil,
                    maxRetries: UInt? = nil,
                    minContextSlot: UInt64? = nil) {
            self.encoding = encoding
            self.skipPreflight = skipPreflight
            self.preflightCommitment = preflightCommitment
            self.maxRetries = maxRetries
            self.minContextSlot = minContextSlot
        }
    }
}

extension ACSolanaInteractor {
    
    /// Submiting a signed transaction to the cluster for processing.
    /// - Parameters:
    ///   - txHash: Fully-signed Transaction, as encoded string.
    ///   - optionalParams: Optional params for the request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: First Transaction Signature embedded in the transaction, as base-58 encoded string.
    public func sendTransaction(txHash: String,
                                optionalParams: ACSolanaSendTransaction.OptionalParams,
                                rpcAddress: String? = nil,
                                dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> String {
        try await callRPCMethod(ACSolanaSendTransaction.methodName,
                                rpcAddress: rpcAddress,
                                singleValueParams: [txHash],
                                pairedParams: [optionalParams],
                                dataStreamParams: dataStreamParams)
    }
}
