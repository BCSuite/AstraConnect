//
//  ACSolanaLoadedAddresses.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//

import Foundation

/// Transaction addresses loaded from address lookup tables.
public struct ACSolanaLoadedAddresses: Codable {
    
    /// Ordered list of base-58 encoded addresses for writable loaded accounts
    public var writable: [String]
    
    /// rdered list of base-58 encoded addresses for readonly loaded accounts
    public var readonly: [String]
    
    /// Create a instance of the LoadedAddresses.
    /// - Parameters:
    ///   - writable: Ordered list of base-58 encoded addresses for writable loaded accounts
    ///   - readonly: rdered list of base-58 encoded addresses for readonly loaded accounts
    public init(writable: [String], readonly: [String]) {
        self.writable = writable
        self.readonly = readonly
    }
}
