//
//  ACSolanaGetBlock.swift
//  AstraConnect
//
//  Created by scott on 2025/10/23.
//

import Foundation

/// A namespace represents informations about the Solana getBlock RPC API.
/// official doc is: https://solana.com/docs/rpc/http/getblock
public enum ACSolanaGetBlock {
    
    /// Method name of the getBlock method.
    public static let methodName = "getBlock"
    
    /*
     "commitment": "finalized",
     "encoding": "json",
     "transactionDetails": "full",
     "maxSupportedTransactionVersion": 0,
     "rewards": false
     */
    /// The data model represents optional params used for the 'getBlock' RPC method, details are shown as above:
    public struct OptionalParams: Encodable {
        
        /// The commitment describes how finalized a block is at that point in time.
        public var commitment: ACSolanaRPCAPI.StateCommitment?
        
        /// Encoding format for Account data. Only supports 'base58', 'base64', 'json', 'jsonParsed'.
        public var encoding: ACSolanaRPCAPI.encodingKind?
        
        /// Level of transaction detail to return. If set to 'signatures' or 'none',  the RPC response result will not contain any
        /// transaction, that is, transactions in BlockInfo will be nil.
        public var transactionDetails: String?
        
        /// ** Using ACSolanaRPCAPI.maxSupportedTransactionVersion**. This parameter determines the maximum transaction version
        /// that will be returned in the response. If you request a transaction with a higher version than this value,
        /// an error will be returned. If you omit this parameter, only legacy transactions will be returned—any versioned
        /// transaction will result in an error.
        public var maxSupportedTransactionVersion: UInt64?
        
        /// Whether to populate the rewards array. If parameter not provided, the default includes rewards.
        public var rewards: Bool?
        
        /// Create a instance of OptionalParams which  representsoptional params used for the 'getBlock' RPC method.
        /// - Parameters:
        ///   - commitment: The commitment describes how finalized a block is at that point in time.
        ///   - encoding: Encoding format for Account data.
        ///   - transactionDetails: Level of transaction detail to return. If set to 'signatures' or 'none' the RPC response result will not contain
        ///   any  transaction, that is, transactions in BlockInfo will be nil.
        ///
        ///   - maxSupportedTransactionVersion: Determining the maximum transaction version that will be returned in the response.
        ///   - rewards: Whether to populate the rewards array. If parameter not provided, the default includes rewards.
        public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil,
                    encoding: ACSolanaRPCAPI.encodingKind? = nil,
                    transactionDetails: String? = nil,
                    maxSupportedTransactionVersion: UInt64? = ACSolanaRPCAPI.maxSupportedTransactionVersion,
                    rewards: Bool? = nil) {
            self.commitment = commitment
            self.encoding = encoding
            self.transactionDetails = transactionDetails
            self.maxSupportedTransactionVersion = maxSupportedTransactionVersion
            self.rewards = rewards
        }
    }
    
    /*
     "result": {
     "blockHeight": 428,
     "blockTime": null,
     "blockhash": "3Eq21vXNB5s86c62bVuUfTeaMif1N2kUqRPBmGRJhyTA",
     "parentSlot": 429,
     "previousBlockhash": "mfcyqEXB3DnHXki6KjjmZck6YjmZLvpAByy2fj4nh6B",
     "transactions": [
     {
     "meta": {
     },
     "transaction": {
     }
     }
     ]
     },
     */
    /// The model represents the result data structure within response from 'getBlock' RPC method. Deatails are shown as above.
    ///  The official  doc is  https://solana.com/docs/rpc/http/getblock
    public struct BlockInfo: Codable {
        
        /// The number of blocks beneath this block.
        public var blockHeight: UInt64?
        
        /// Estimated production time, as Unix timestamp (seconds since the Unix epoch). null if not available.
        public var blockTime: UInt64?
        
        /// The blockhash of this block, as base-58 encoded string
        public var blockhash: String
        
        /// The slot index of this block's parent
        public var parentSlot: UInt64
        
        ///  The blockhash of this block's parent, as base-58 encoded string; if the parent block is not available due to ledger cleanup, this field will
        ///   return  "11111111111111111111111111111111"
        public var previousBlockhash: String
        
        /// Present if "full" transaction details are requested. If set the request param 'transactionDetails' to 'signatures' or 'none', this will not be returned.
        public var transactions: [Transaction]?
        
        /// Present if "full" transaction details are requested; an array of JSON objects containing:
        ///   transaction: <object|[string,encoding]> - Transaction object, either in JSON format or encoded binary data,
        ///   depending on encoding parameter.
        ///
        ///   meta: <object> - Transaction status metadata object or null.
        public struct Transaction: Codable {
            
            /// Transaction object, either in JSON format or encoded binary data, depending on encoding parameter.
            public var transaction: ACDynamicCodation
            
            /// Transaction status metadata object or null.
            public var meta: ACSolanaTxStatusMetadata?
        }
        
        /// Create a instance of the BlockInfo which represents the result data structure within response from 'getBlock' RPC method.
        /// - Parameters:
        ///   - blockHeight: The number of blocks beneath this block.
        ///   - blockTime: Estimated production time, as Unix timestamp (seconds since the Unix epoch).
        ///   - blockhash: The blockhash of this block, as base-58 encoded string
        ///   - parentSlot: The slot index of this block's parent
        ///   - previousBlockhash: The blockhash of this block's parent, as base-58 encoded string
        ///   - transactions: Present if "full" transaction details are requested.
        public init(blockHeight: UInt64? = nil,
                    blockTime: UInt64? = nil,
                    blockhash: String,
                    parentSlot: UInt64,
                    previousBlockhash: String,
                    transactions: [Transaction]) {
            self.blockHeight = blockHeight
            self.blockTime = blockTime
            self.blockhash = blockhash
            self.parentSlot = parentSlot
            self.previousBlockhash = previousBlockhash
            self.transactions = transactions
        }
    }
}

extension ACSolanaInteractor {
    
    /// Get block information according to the slot number.
    /// - Parameters:
    ///   - slotNum: The slot number of the block.
    ///   - optionalParams: Optional params used for the 'getBlock' request.  The encoding type only supports 'base58', 'base64', 'json', 'jsonParsed'.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: Block informations.
    public func getBlock(by slotNum: UInt64,
                         optionalParams: ACSolanaGetBlock.OptionalParams? = nil,
                         rpcAddress: String? = nil,
                         dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> ACSolanaGetBlock.BlockInfo {
        try await callRPCMethod(ACSolanaGetBlock.methodName,
                                rpcAddress: rpcAddress,
                                singleValueParams: [slotNum],
                                pairedParams: [optionalParams],
                                dataStreamParams: dataStreamParams)
    }
}
