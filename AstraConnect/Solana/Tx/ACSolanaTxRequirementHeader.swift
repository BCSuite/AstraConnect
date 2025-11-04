//
//  ACSolanaTxRequirementHeader.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//


import Foundation

/// Details the account types and signatures required by the transaction.
public struct ACSolanaTxRequirementHeader: Codable {
    
    /// The total number of signatures required to make the transaction valid. The signatures must match the first
    /// numRequiredSignatures of message.accountKeys.
    public var numRequiredSignatures: UInt64
    
    /// The last numReadonlySignedAccounts of the signed keys are read-only accounts. Programs may process multiple
    ///  transactions that load read-only accounts within a single PoH entry, but are not permitted to credit or debit lamports
    ///  or modify account data. Transactions targeting the same read-write account are evaluated sequentially.
    public var numReadonlySignedAccounts: UInt64
    
    /// The last numReadonlyUnsignedAccounts of the unsigned keys are read-only accounts.
    public var numReadonlyUnsignedAccounts: UInt64
    
    /// Creating a instance of ACSolanaTxInfoHeader
    /// - Parameters:
    ///   - numRequiredSignatures: The total number of signatures required to make the transaction valid. The signatures must match the first
    ///   numRequiredSignatures of message.accountKeys.
    ///
    ///   - numReadonlySignedAccounts: The last numReadonlySignedAccounts of the signed keys are read-only accounts. Programs may process multiple
    ///   transactions that load read-only accounts within a single PoH entry, but are not permitted to credit or debit lamports
    ///   or modify account data. Transactions targeting the same read-write account are evaluated sequentially.
    ///
    ///   - numReadonlyUnsignedAccounts: The last numReadonlyUnsignedAccounts of the unsigned keys are read-only accounts.
    public init(numRequiredSignatures: UInt64, numReadonlySignedAccounts: UInt64, numReadonlyUnsignedAccounts: UInt64) {
        self.numRequiredSignatures = numRequiredSignatures
        self.numReadonlySignedAccounts = numReadonlySignedAccounts
        self.numReadonlyUnsignedAccounts = numReadonlyUnsignedAccounts
    }
}
