//
//  ACSolansTxMessage.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//


import Foundation

/// Defines the content of the transaction.
public struct ACSolansTxMessage: Codable {
    
    /// List of base-58 encoded public keys used by the transaction, including by the instructions and for signatures.
    /// The first message.header.numRequiredSignatures public keys must sign the transaction.
    public var accountKeys: [String]
    /// Details the account types and signatures required by the transaction
    public var header: ACSolanaTxRequirementHeader
    
    ///  List of program instructions that will be executed in sequence and committed in one atomic transaction if all succeed.
    public var instructions: [ACSolanaInstruction]
    
    /// A base-58 encoded hash of a recent block in the ledger used to prevent transaction
    /// duplication and to give transactions lifetimes.
    public var recentBlockhash: String
    
    /// List of address table lookups used by a transaction to dynamically load addresses from on-chain address lookup tables. Undefined if maxSupportedTransactionVersion is not set.
    public var addressTableLookup: [ACSolanaAddressTableLookup]?
    
    public init(accountKeys: [String], header: ACSolanaTxRequirementHeader,
                instructions: [ACSolanaInstruction], recentBlockhash: String,
                addressTableLookup: [ACSolanaAddressTableLookup]? = nil) {
        self.accountKeys = accountKeys
        self.header = header
        self.instructions = instructions
        self.recentBlockhash = recentBlockhash
        self.addressTableLookup = addressTableLookup
    }
}
