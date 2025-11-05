//
//  ACSolanaTokenSupplyInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/11/1.
//

import Foundation

/// A model represents the total supply information of an SPL Token type.
///  The official doc is https://solana.com/docs/rpc/http/gettokensupply.
public struct ACSolanaTokenSupplyInfo: Codable, Sendable {

    /// The raw total token supply without decimals, a string representation of UInt64.
    public var amount: String
    
    /// Number of base 10 digits to the right of the decimal place.
    public var decimals: UInt8
    
    /// The total token supply, using mint-prescribed decimals.
    public var uiAmount: Double?
    
    /// The total token supply as a string, using mint-prescribed decimals.
    public var uiAmountString: String
    
    /// Creating a instance of ACSolanaTokenSupplyInfo which represents the total supply information of an SPL Token type.
    /// - Parameters:
    ///   - amount: The raw total token supply without decimals, a string representation of UInt64.
    ///   - decimals: Number of base 10 digits to the right of the decimal place.
    ///   - uiAmount: The total token supply, using mint-prescribed decimals.
    ///   - uiAmountString: The total token supply as a string, using mint-prescribed decimals.
    public init(amount: String, decimals: UInt8, uiAmount: Double? = nil, uiAmountString: String) {
        self.amount = amount
        self.decimals = decimals
        self.uiAmount = uiAmount
        self.uiAmountString = uiAmountString
    }
}
