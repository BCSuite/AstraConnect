//
//  ACSolanaSupplyInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A model represents the information about the current supply.
public struct ACSolanaSupplyInfo: Codable {
    
    /// Circulating supply in lamports.
    public var circulating: UInt64
    
    /// Non-circulating supply in lamports.
    public var nonCirculating: UInt64
    
    /// An array of account addresses of non-circulating accounts, as strings. If excludeNonCirculatingAccountsList is enabled, the returned array will be empty.
    public var nonCirculatingAccounts: [String]?
    
    /// Total supply in lamports.
    public var total: UInt64
    
    /// Creating a instance of ACSolanaSupplyInfo which represents the information about the current supply..
    /// - Parameters:
    ///   - circulating: Circulating supply in lamports.
    ///   - nonCirculating: Non-circulating supply in lamports.
    ///   - nonCirculatingAccounts: An array of account addresses of non-circulating accounts, as strings. If excludeNonCirculatingAccountsList
    ///   is enabled, the returned array will be empty.
    ///
    ///   - total: Total supply in lamports.
    public init(circulating: UInt64,
                nonCirculating: UInt64,
                nonCirculatingAccounts: [String]? = nil,
                total: UInt64) {
        self.circulating = circulating
        self.nonCirculating = nonCirculating
        self.nonCirculatingAccounts = nonCirculatingAccounts
        self.total = total
    }
}
