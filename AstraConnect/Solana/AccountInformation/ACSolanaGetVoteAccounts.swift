//
//  ACSolanaGetVoteAccounts.swift
//  AstraConnect
//
//  Created by scott on 2025/11/2.
//

import Foundation

/// A namespace represents informations about the Solana getVoteAccounts RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getvoteaccounts.
public enum ACSolanaGetVoteAccounts {
    
    /// Name of the getVoteAccounts RPC method.
    public static let methodName = "getVoteAccounts"
    
    /// A model represents optional params used for the getVoteAccounts request.
    public struct OptionalParams: Codable {
       
        /// Type description of Configuring State Commitment.
        public var commitment: ACSolanaRPCAPI.StateCommitment?
        
        /// Only return results for this validator vote address (base-58 encoded).
        public var votePubkey: String?
        
        /// Do not filter out delinquent validators with no stake.
        public var keepUnstakedDelinquents: Bool?
        
        /// Specify the number of slots behind the tip that a validator must fall to be considered delinquent. NOTE: For the sake of consistency between ecosystem
        /// products, it is not recommended that this argument be specified.
        public var delinquentSlotDistance: UInt64?
        
        /// Creating a instance of ACSolanaGetVoteAccounts.OptionalParams used for he getVoteAccounts request.
        /// - Parameters:
        ///   - commitment: Type description of Configuring State Commitment.
        ///   - votePubkey: Only return results for this validator vote address (base-58 encoded).
        ///   - keepUnstakedDelinquents: Do not filter out delinquent validators with no stake.
        ///   - delinquentSlotDistance: Specify the number of slots behind the tip that a validator must fall to be considered delinquent.
        ///   NOTE: For the sake of consistency between ecosystem products, it is not recommended that this argument be specified.
        public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil,
                    votePubkey: String? = nil,
                    keepUnstakedDelinquents: Bool? = nil,
                    delinquentSlotDistance: UInt64? = nil) {
            self.commitment = commitment
            self.votePubkey = votePubkey
            self.keepUnstakedDelinquents = keepUnstakedDelinquents
            self.delinquentSlotDistance = delinquentSlotDistance
        }
    }
    
    public struct Result: Codable {
        
        /// Detailed vote account information.
        public var current: [ACSolanaVoteAccountInfo]
        
        public var delinquent: [ACDynamicCodation]
        
        public init(
            current: [ACSolanaVoteAccountInfo],
            delinquent: [ACDynamicCodation]
        ) {
            self.current = current
            self.delinquent = delinquent
        }
    }
}

extension ACSolanaInteractor {
    
    /// Getting the account info and associated stake for all the voting accounts in the current bank.
    /// - Parameters:
    ///   - optionalParams: Optional params for the request.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: Tthe account info and associated stake for all the voting accounts in the current bank.
    public func getVoteAccounts(optionalParams: ACSolanaGetVoteAccounts.OptionalParams? = nil,
                                rpcAddress: String? = nil,
                                dataStreamParams: any ACReqDSA = ACSolReqDSP()) async throws -> [ACSolanaVoteAccountInfo] {
        var result: ACSolanaGetVoteAccounts.Result
        result = try await callRPCMethod(ACSolanaGetVoteAccounts.methodName,
                                         rpcAddress: rpcAddress,
                                         singleValueParams: nil,
                                         pairedParams: [optionalParams],
                                         dataStreamParams: dataStreamParams)
        return result.current
    }
}
