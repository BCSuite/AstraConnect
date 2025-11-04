//
//  ACSolanaGetLeaderSchedule.swift
//  AstraConnect
//
//  Created by scott on 2025/10/30.
//

import Foundation

/// A namespace represents informations about the Solana  'getLeaderSchedule' RPC API.
/// The official doc is https://solana.com/docs/rpc/http/getleaderschedule.
public enum ACSolanaGetLeaderSchedule {
    
    /// Name of the getHealth RPC method.
    public static let methodName = "getLeaderSchedule"
    
    /// A  model represents  optional params used for the 'getLeaderSchedule' request.
    public struct OptionalParams: Encodable {
        
        /// The commitment describes how finalized a block is at that point in time.
        public var commitment: ACSolanaRPCAPI.StateCommitment?
        
        /// Only return results for this validator identity (base-58 encoded).
        public var identity: String?
        
        /// creating a instance of ACSolanaGetLeaderSchedule.OptionalParams which  represents  optional params used for the 'getLeaderSchedule' request.
        /// - Parameters:
        ///   - commitment: The commitment describes how finalized a block is at that point in time.
        ///   - identity: Only return results for this validator identity (base-58 encoded).
        public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil, identity: String? = nil) {
            self.commitment = commitment
            self.identity = identity
        }
    }
}

extension ACSolanaInteractor {
    /*
     "result": {
     "4Qkev8aNZcqFNSRhQzwyLMFSsi94jHqE8WNVTJzTP99F": [
     0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
     21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
     39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56,
     57, 58, 59, 60, 61, 62, 63
     ]
     },*/
    /// Getting the leader schedule for an epoch.
    /// - Parameters:
    ///   - optionalParams: Optional params for the request.
    ///   - slot: Once provided, fetching the leader schedule for the epoch that corresponds. Otherwise, the leader schedule for the current epoch is fetched.
    ///   - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///   - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: null if requested epoch is not found, otherwise returns an map where:
    ///   Keys are validator identities (as base-58 encoded strings)
    ///   Values are arrays of leader slot indices relative to the first slot in the requested epoch
    public func getLeaderSchedule(optionalParams: ACSolanaGetLeaderSchedule.OptionalParams? = nil,
                                  slot: UInt64? = nil,
                                  rpcAddress: String? = nil,
                                  dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> [String: [UInt64]]? {
        do {
            let result: [String: [UInt64]] = try await callRPCMethod(ACSolanaGetLeaderSchedule.methodName,
                                                                     rpcAddress: rpcAddress,
                                                                     singleValueParams: [slot],
                                                                     pairedParams: [optionalParams],
                                                                     dataStreamParams: dataStreamParams)
            return result
        } catch {
            // This RPC method may return nil result.
            guard let acErr = error as? ACError<Int, String>,
                  acErr.code == ACRPCProcessErrorKind.nilResult.rawValue else {
                throw error
            }
            return nil
        }
    }
}
