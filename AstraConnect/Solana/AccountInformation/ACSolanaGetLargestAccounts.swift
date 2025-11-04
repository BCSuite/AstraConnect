//
//  ACSolanaGetLargestAccounts.swift
//  AstraConnect
//
//  Created by scott on 2025/10/30.
//

import Foundation

/// A namespace represents informations about the Solana getLargestAccounts RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getlargestaccounts.
public enum ACSolanaGetLargestAccounts {
    
    /// Name of getHealth RPC method.
    public static let methodName = "getLargestAccounts"
    
    public struct OptionalParams: Codable {
        
        /// Type description of Configuring State Commitment.
        public var commitment: ACSolanaRPCAPI.StateCommitment?
        
        /// Filter results by account type.
        public var filter: ACSolanaRPCAPI.AccountsFilterKind?
        
        /// Creating optional params for the getLargestAccounts RPC method.
        /// - Parameters:
        ///   - commitment: Type description of Configuring State Commitment.
        ///   - filter: Filter results by account type.
        public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil,
                    filter: ACSolanaRPCAPI.AccountsFilterKind? = nil) {
            self.commitment = commitment
            self.filter = filter
        }
    }
    
    /*
     {
     "address": "99P8ZgtJYe1buSK8JXkvpLh8xPsCFuLYhz9hQFNw93WJ",
     "lamports": 999974
     }
     */
    
    /// A model represents largest accounts, by lamport balance.
    public struct Info: Codable {
        
        /// Base-58 encoded address of the account
        public var address: String
        
        /// Number of lamports in the account.
        public var lamports: UInt64
        
        /// Creating a instance of Info which represents  the  accounts informations returned by the getLargestAccounts method.
        /// - Parameters:
        ///   - address: Base-58 encoded address of the account
        ///   - lamports: Number of lamports in the account.
        public init(address: String, lamports: UInt64) {
            self.address = address
            self.lamports = lamports
        }
    }
}

extension ACSolanaInteractor {
    
    /// Getting the 20 largest accounts, by lamport balance (results may be cached up to two hours).
    /// - Parameters:
    ///   - optionalParams: Optional params for the request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams:Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: An ACSolanaGetLargestAccounts.Info  array.
    public func getLargestAccounts(optionalParams: ACSolanaGetLargestAccounts.OptionalParams? = nil,
                                   rpcAddress: String? = nil,
                                   dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [ACSolanaGetLargestAccounts.Info] {
        var result: ACSolanaUniRespResult<[ACSolanaGetLargestAccounts.Info]>
        result =  try await callRPCMethod(ACSolanaGetLargestAccounts.methodName,
                                          rpcAddress: rpcAddress,
                                          singleValueParams: nil,
                                          pairedParams: [optionalParams],
                                          dataStreamParams: dataStreamParams)
        return result.value
        
    }
}
