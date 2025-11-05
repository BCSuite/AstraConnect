//
//  ACSolanaRPCAPI.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// A namespace stores shared informations about Solana RPC API.
public enum ACSolanaRPCAPI {
    
    //MARK: -Keys & Values
    
    /// Key of Configuring State Commitment field in a RPC request.
    public static let stateCommitmentKey = "commitment"
    
    /// Key of 'minContextSlot' in  a RPC request.
    public static let minContextSlotKey = "minContextSlot"
    
    /// Key of 'encoding' field in  a RPC request.
    public static let encodingKey = "encoding"
    
    /// Key of 'encoding'  field in  a RPC request.
    public static let dataSliceKey = "dataSlice"
    
    /// Key of 'length'  field in  a RPC request
    public static let lengthKey = "length"
    
    /// Key of 'offset'  field in  a RPC request
    public static let offsetKey = "offset"
    
    /// Currently, the only valid value for this parameter is 0. Setting it to 0 allows you to fetch all transactions,
    /// including both Versioned and legacy transactions.
    public static let maxSupportedTransactionVersion = UInt64.zero
    
    //MARK: -Types
    
    /// Type description of Configuring State Commitment.
    public enum StateCommitment: String, Codable, Sendable {
        
        /// The cluster has recognized this block as finalized
        case finalized
        
        /// The node will query the most recent block that has been voted on by supermajority of the cluster.
        case confirmed
        
        /// The  node will query its most recent block. Note that the block may still be skipped by the cluster.
        case processed
    }
    
    /// Type description of encoding.
    public enum encodingKind: String, Codable, Sendable {
        
        /// It is slow and limited to less than 129 bytes of Account data.
        case base58
        
        /// Will return base64 encoded data for Account data of any size
        case base64
        
        /// Compresses the Account data using Zstandard and base64-encodes the result.
        case base64Zstd = "base64+zstd"
        
        /// encoding attempts to use program-specific state parsers to return more human-readable and explicit account state data.
        case jsonParsed
        
        /// JSON format.
        case json
    }
    
    /**
     Level of transaction detail to return.
     If accounts are requested, transaction details only include signatures and an annotated list of accounts in each transaction.
     Transaction metadata is limited to only: fee, err, pre_balances, post_balances, pre_token_balances, and post_token_balances.
     */
    public enum TxDetail: String {
        case full, accounts, signatures, none
    }
    
    /// Filter by account type
    public enum AccountsFilterKind: String, Codable, Sendable {
        case circulating, nonCirculating
    }
    
    //MARK: -Universal Methods
    /*
     "params": [
     "83ast...3mDLVcri", // Public key
     5, // Start slot
     {
     "xxx": "yyy", // Param1
     "xxx": "yyy" // Param2
     }
     ]
     */
    
    /// Build the universal  'params'  for a RPC request according to variadic required params and  optional  params, applicable formats are shown above.
    /// - Parameters:
    ///   - requiredVariadic: Using variadic to receive several required params, and nil will be filtered out.
    ///   - listParams:  The corresponding optional params placed in a array, every item must be a ACDynamicCodation and its wrappedValue
    ///   must be an array, otherwise leading to invalid request params.
    ///   - pairedParams: The corresponding optional params paired with key-value like {"key1": "value1" }.
    /// - Returns: A  array includes all encodable params.
    public static func buildRequestParams(requiredVariadic: (any Encodable)...,
                                          listParams: [ACDynamicCodation]?,
                                          pairedParams: [any Encodable]? = nil) -> [any Encodable] {
        Self.buildRequestParams(singleValueParams: requiredVariadic,
                                listParams: nil,
                                pairedParams: pairedParams)
    }
    
    /// Build the universal  'params'  for a RPC request according to required params list  and  optional  params,
    /// - Parameters:
    ///   - singleValueParams: The params list made up of the single value which contains only value not key, for example: {"params": [singleValue1, singleValue2, {"key1": "value1" }]},  singleValue1 and  singleValue2 are single values without key and placed in a array directly.
    ///   - listParams: The corresponding optional params placed in a array, every item must be a ACDynamicCodation and its wrappedValue
    ///   must be an array, otherwise leading to invalid request params.
    ///   - pairedParams: The corresponding optional params paired with key-value like {"key1": "value1" }.
    /// - Returns: A  array includes all encodable rarams.
    public static func buildRequestParams(singleValueParams: [any Encodable]?,
                                          listParams: [ACDynamicCodation]?,
                                          pairedParams: [any Encodable]? = nil) -> [any Encodable] {
        var params = [any Encodable]()
        // Filter out nil.
        if let singleValueParams = singleValueParams, !singleValueParams.isEmpty {
            params.append(contentsOf: singleValueParams.compactMap({ $0 }))
        }
        // Append optional list params.
        if let listParams = listParams, !listParams.isEmpty {
            params.append(contentsOf: listParams.compactMap({ $0 }))
        }
        // Append optional params.
        if let pairedParams = pairedParams {
            params.append(contentsOf: pairedParams.compactMap({ $0 }))
        }
        return params
    }
    
}

extension ACSolanaInteractor {
    
    /// Calling corresponding RPC methods according to the method name and related params.
    /// - Parameters:
    ///   - methodName: Detailed RPC method name to be called.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - singleValueParams: The params list made up of the single value which contains only value not key, for example: {"params": [singleValue1, singleValue2, {"key1": "value1" }]},  singleValue1 and  singleValue2 are single values without key and placed in a array directly.
    ///    O
    ///   - listParams: The corresponding optional params placed in a array, every item must be a ACDynamicCodation and its wrappedValue
    ///   must be an array, otherwise leading to invalid request params.
    ///
    ///   - pairedParams: The corresponding optional params paired with key-value like {"key1": "value1" }.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: Detailed result in the response return by the RPC,  must satifies the ACSolanaJSONRPCResponse<Result> format.
    public func callRPCMethod<Result: Decodable>(_ methodName: String,
                                                 rpcAddress: String? = nil,
                                                 singleValueParams: [any Encodable]? = nil,
                                                 listParams: [ACDynamicCodation]? = nil,
                                                 pairedParams: [any Encodable]? = nil,
                                                 dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> Result {
        
        // Building the request.
        let dataInfo = dataStreamParams.dataInfo
        // Getting the correspoonding request builder.
        guard let reqBuilder = dataStreamParams.reqGenerator.generateBuilder(by: dataInfo) else {
            throw ACRPCProcessErrorKind.unsupportedDataType.buildError(entity: String(describing: Self.self),
                                                                       msg: dataInfo.typeName)
        }
        // Using interactor's 'rpcAddress' by default.
        var rpcAddr = self.rpcAddress
        if let rpcAddress = rpcAddress, !rpcAddress.isEmpty {
            rpcAddr = rpcAddress
        }
        // Building the detailed request.
        let request = reqBuilder.buildRequest(methodName: methodName,
                                              rpcAddress: rpcAddr,
                                              singleValueParams: singleValueParams,
                                              listParams: listParams,
                                              pairedParams: pairedParams)
        // Request data.
        let result: Result = try await self.request(request,
                                                    respGenerator: ACSolanaResponsiveDefaultFactory.self)
        return result
        
    }
}




