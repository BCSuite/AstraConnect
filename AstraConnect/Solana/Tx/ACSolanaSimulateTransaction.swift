//
//  ACSolanaSimulateTransaction.swift
//  AstraConnect
//
//  Created by scott on 2025/11/2.
//

import Foundation

/// A namespace represents informations about the Solana simulateTransaction RPC API.
/// The official doc is https://solana.com/docs/rpc/http/simulatetransaction.
public enum ACSolanaSimulateTransaction {
    
    /// Method name of the simulateTransaction method.
    public static let methodName = "simulateTransaction"
    
    /// Optional params for the 'simulateTransaction' RPC method.
    public struct OptionalParams: Codable {
        
        /// Type description of Configuring State Commitment. The RPC handle as 'finalized' if not set.
        public var commitment: ACSolanaRPCAPI.StateCommitment?
        
        /// Encoding for filter bytes data, only supports "base58" or "base64". Data is limited in size to 128 or fewer decoded bytes.
        public var encoding: ACSolanaRPCAPI.encodingKind?
        
        /// If true the transaction recent blockhash will be replaced with the most recent blockhash (conflicts with sigVerify).
        public var replaceRecentBlockhash: Bool?
        
        /// If true the transaction signatures will be verified (conflicts with replaceRecentBlockhash).
        public var sigVerify: Bool?
        
        /// The minimum slot that the request can be evaluated at.
        public var minContextSlot: UInt64?
        
        /// If true the response will include inner instructions. These inner instructions will be jsonParsed where possible, otherwise json.
        public var innerInstructions: Bool?
        
        /// Accounts configuration.
        public var accounts: Accounts?
        
        public struct Accounts: Codable {
            
            /// An array of accounts to return, as base-58 encoded strings.
            public var addresses: [String]
            
            /// Encoding for returned Account data, Note: jsonParsed encoding attempts to use program-specific state parsers to
            /// return more human-readable and explicit account state data. If jsonParsed is requested but a parser cannot be found,
            /// the field falls back to base64 encoding, detectable when the returned accounts.data field is type string.
            public var encoding: ACSolanaRPCAPI.StateCommitment
            
            /// Creating a instance of Accounts which used for the 'accounts' param of ACSolanaSimulateTransaction.OptionalParams
            /// - Parameters:
            ///   - addresses: An array of accounts to return, as base-58 encoded strings.
            ///   - encoding:  Encoding for returned Account data, Note: jsonParsed encoding attempts to use program-specific state parsers to
            /// return more human-readable and explicit account state data. If jsonParsed is requested but a parser cannot be found,
            /// the field falls back to base64 encoding, detectable when the returned accounts.data field is type string.
            public init(addresses: [String], encoding: ACSolanaRPCAPI.StateCommitment) {
                self.addresses = addresses
                self.encoding = encoding
            }
        }
        
        /// Creating a instance of the ACSolanaSimulateTransaction.OptionalParams which used for the 'simulateTransaction' RPC method.
        /// - Parameters:
        ///   - commitment: ype description of Configuring State Commitment. The RPC handle as 'finalized' if not set.
        ///   - encoding: Encoding for returned Account data, Note: jsonParsed encoding attempts to use program-specific state parsers to
        /// return more human-readable and explicit account state data. If jsonParsed is requested but a parser cannot be found,
        /// the field falls back to base64 encoding, detectable when the returned accounts.data field is type string.
        ///
        ///   - replaceRecentBlockhash: If true the transaction recent blockhash will be replaced with the most recent blockhash (conflicts with sigVerify).
        ///   - sigVerify: If true the transaction signatures will be verified (conflicts with replaceRecentBlockhash).
        ///   - minContextSlot: The minimum slot that the request can be evaluated at.
        ///   - innerInstructions: If true the response will include inner instructions. These inner instructions will be jsonParsed where possible, otherwise json.
        ///   - accounts: Accounts configuration.
        public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil, encoding: ACSolanaRPCAPI.encodingKind? = nil, replaceRecentBlockhash: Bool? = nil, sigVerify: Bool? = nil, minContextSlot: UInt64? = nil, innerInstructions: Bool? = nil, accounts: Accounts? = nil) {
            self.commitment = commitment
            self.encoding = encoding
            self.replaceRecentBlockhash = replaceRecentBlockhash
            self.sigVerify = sigVerify
            self.minContextSlot = minContextSlot
            self.innerInstructions = innerInstructions
            self.accounts = accounts
        }
    }
}

extension ACSolanaInteractor {
    
    /// Simulating sending a transaction.
    /// - Parameters:
    ///   - txHash: Simulated transaction hash , as an encoded string.
    ///   - optionalParams: Optional params for the request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    ///
    /// - Returns: An ACSolanasimulationTxInfo which represents all related informations about simulated transaction.
    public func simulateTransaction(txHash: String,
                                    optionalParams: ACSolanaSimulateTransaction.OptionalParams? = nil,
                                    rpcAddress: String? = nil,
                                    dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> ACSolanasimulationTxInfo {
        var result: ACSolanaUniRespResult<ACSolanasimulationTxInfo>
        result = try await callRPCMethod(ACSolanaSimulateTransaction.methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: [txHash],
                                         pairedParams: [optionalParams],
                                         dataStreamParams: dataStreamParams)
        return result.value
    }
}
