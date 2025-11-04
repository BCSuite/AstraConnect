//
//  ACSolanaAddressTableLookup.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//


import Foundation

/// address table lookups used by a transaction to dynamically load addresses from on-chain address lookup tables.
public struct ACSolanaAddressTableLookup: Codable {
    
    /// Base-58 encoded public key for an address lookup table account.
    public var accountKey: String
    
    /// List of indices used to load addresses of writable accounts from a lookup table.
    public var writableIndexes: [UInt64]
    
    /// List of indices used to load addresses of readonly accounts from a lookup table.
    public var readonlyIndexes: [UInt64]
    
    /// Creating a instance of ACSolanaAddressTableLookup which used by a transaction to dynamically load addresses from on-chain address lookup tables.
    /// - Parameters:
    ///   - accountKey: Base-58 encoded public key for an address lookup table account.
    ///   - writableIndexes: List of indices used to load addresses of writable accounts from a lookup table.
    ///   - readonlyIndexes: List of indices used to load addresses of readonly accounts from a lookup table.
    public init(accountKey: String, writableIndexes: [UInt64], readonlyIndexes: [UInt64]) {
        self.accountKey = accountKey
        self.writableIndexes = writableIndexes
        self.readonlyIndexes = readonlyIndexes
    }
    
}
