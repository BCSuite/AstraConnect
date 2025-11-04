//
//  ACSolanaAccountOptionalParams.swift
//  AstraConnect
//
//  Created by scott on 2025/10/30.
//


import Foundation

/// The data model represent optional params used for the 'getAccountInfo' RPC method.
public struct ACSolanaAccountOptionalParams: Codable {
    
    /// The commitment describes how finalized a block is at that point in time.
    public var commitment: ACSolanaRPCAPI.StateCommitment?
    
    /// Encoding format for Account data.
    public var encoding: ACSolanaRPCAPI.encodingKind?
    
    /// Request a slice of the account's data.
    public var dataSlice: ACSolanaDataSlice?
    
    /// The minimum slot that the request can be evaluated at.
    public var minContextSlot: UInt64?
    
    /// Create a instance of OptionalParams which represents optional params used for the 'getAccountInfo' RPC method.
    /// - Parameters:
    ///   - commitment: The commitment describes how finalized a block is at that point in time.
    ///   - encoding: Encoding format for Account data.
    ///   - dataSlice: Request a slice of the account's data.
    ///   - minContextSlot: The minimum slot that the request can be evaluated at.
    public init(commitment: ACSolanaRPCAPI.StateCommitment? = nil,
                encoding: ACSolanaRPCAPI.encodingKind? = nil,
                dataSlice: ACSolanaDataSlice? = nil,
                minContextSlot: UInt64? = nil) {
        self.commitment = commitment
        self.encoding = encoding
        self.dataSlice = dataSlice
        self.minContextSlot = minContextSlot
    }
}
