//
//  ACSolanaBaseOptionalParams.swift
//  AstraConnect
//
//  Created by scott on 2025/10/28.
//

/*
 /*
  "params": [
     {
       "commitment": "finalized" // Optional param.
        "minContextSlot": 1      // Optional param.
     }
   ]
  */
 */
/// The data model represent base optional params used for the RPC request.
public struct ACSolanaBasicOptionalParams: Encodable {
    
    /// The commitment describes how finalized a block is at that point in time.
    public var commitment: ACSolanaRPCAPI.StateCommitment?
    
    /// The minimum slot that the request can be evaluated at.
    public var minContextSlot: UInt64?
    
    /// Create a instance of OptionalParams which represents optional params used for the 'getBalance' RPC method.
    /// - Parameters:
    ///   - commitment: The commitment describes how finalized a block is at that point in time.
    ///   - minContextSlot: The minimum slot that the request can be evaluated at.
    public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil, minContextSlot: UInt64? = nil) {
        self.commitment = commitment
        self.minContextSlot = minContextSlot
    }
}
