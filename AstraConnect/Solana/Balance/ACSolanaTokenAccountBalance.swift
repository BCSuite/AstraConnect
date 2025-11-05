//
//  ACSolanaTokenAccountBalance.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/// A model represents the token balance of an SPL Token account.
/// The official doc is https://solana.com/docs/rpc/http/gettokenaccountbalance.
public struct ACSolanaTokenAccountBalance: Codable, Sendable {
    
    /// The raw balance without decimals, a string representation of UInt64.
    public var amount: String
    
    /// Number of base 10 digits to the right of the decimal place.
    public var decimals: UInt8
    
    /// The balance, using mint-prescribed decimals.
    public var uiAmount: Double?
    
    /// The balance as a string, using mint-prescribed decimals.
    public var uiAmountString: String
    
    /// Creating a instance of ACSolanaTokenAccountBalance which represents the token balance of an SPL Token account.
    /// - Parameters:
    ///   - amount: The raw balance without decimals, a string representation of UInt64.
    ///   - decimals: Number of base 10 digits to the right of the decimal place.
    ///   - uiAmount: The balance, using mint-prescribed decimals.
    ///   - uiAmountString: The balance as a string, using mint-prescribed decimals.
    public init(amount: String, decimals: UInt8, uiAmount: Double? = nil, uiAmountString: String) {
        self.amount = amount
        self.decimals = decimals
        self.uiAmount = uiAmount
        self.uiAmountString = uiAmountString
    }
}

