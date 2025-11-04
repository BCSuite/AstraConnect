//
//  ACSolanaGetProgramAccounts.swift
//  AstraConnect
//
//  Created by scott on 2025/10/30.
//

import Foundation

/// A namespace represents informations about the Solana getMultipleAccounts RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getmultipleaccounts.
public enum ACSolanaGetProgramAccounts {
    
    /// Name of the getAccountInfo RPC method.
    public static let methodName = "getProgramAccounts"
    
    /// Optional params used for the 'getMultipleAccounts' request.
    public struct OptionalParams: Codable {
        
        /// Type description of Configuring State Commitment.
        public var commitment: ACSolanaRPCAPI.StateCommitment?
        
        /// The minimum slot that the request can be evaluated at.
        public var minContextSlot: UInt64?
        
        /// Whether Wrap the result in an RpcResponse JSON object.
        public var withContext: Bool?
        
        /// Encoding format for the returned Account data. Only supports 'base58', 'base64', 'jsonParsed', 'base64+zstd'.
        public var encoding: ACSolanaRPCAPI.encodingKind?
        
        /// A slice of the account's data.
        public var dataSlice: ACSolanaDataSlice?
        
        /// Pre-filtering the data and using up to 4 filters.
        public var filters: [ACSolanaDataFilter]?
        
        /// Creating a instanc of ACSolanaGetProgramAccounts.OptionalParams which used for the 'getMultipleAccounts' request..
        /// - Parameters:
        ///   - commitment: ype description of Configuring State Commitment.
        ///   - minContextSlot: The minimum slot that the request can be evaluated at.
        ///   - withContext: Whether Wrap the result in an RpcResponse JSON object.
        ///   - encoding: Encoding format for the returned Account data.
        ///   - dataSlice: A slice of the account's data.
        ///   - filters: Pre-filtering the data and using up to 4 filters.
        public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil, minContextSlot: UInt64? = nil, withContext: Bool? = nil, encoding: ACSolanaRPCAPI.encodingKind? = nil, dataSlice: ACSolanaDataSlice? = nil, filters: [ACSolanaDataFilter]? = nil) {
            self.commitment = commitment
            self.minContextSlot = minContextSlot
            self.withContext = withContext
            self.encoding = encoding
            self.dataSlice = dataSlice
            self.filters = filters
        }
    }
}

extension ACSolanaInteractor {
    
    /// Getting all accounts owned by the provided program Pubkey.
    /// - Parameters:
    ///   - pubKey: The program Pubkey.
    ///   - optionalParams: Optional params for the request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: A ACSolanaProgramAccountInfo list.
    public func getProgramAccounts(pubKey: String,
                                   optionalParams: ACSolanaGetProgramAccounts.OptionalParams? = nil,
                                   rpcAddress: String? = nil,
                                   dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [ACSolanaProgramAccountInfo] {
        if optionalParams?.withContext ?? false {
            // Result contains context.
            var result: ACSolanaUniRespResult<[ACSolanaProgramAccountInfo]>
            result = try await callRPCMethod(ACSolanaGetProgramAccounts.methodName,
                                             rpcAddress: rpcAddress,
                                             singleValueParams: [pubKey],
                                             pairedParams: [optionalParams],
                                             dataStreamParams: dataStreamParams)
            return result.value
        } else {
            // Result does not contains context.
            return try await callRPCMethod(ACSolanaGetProgramAccounts.methodName,
                                           rpcAddress: rpcAddress,
                                           singleValueParams: [pubKey],
                                           pairedParams: [optionalParams],
                                           dataStreamParams: dataStreamParams)
        }
    }
}
