//
//  ACSolanaTokenAccountInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/11/1.
//

import Foundation


/// A model represents the account information of a particular SPL Token.
public struct ACSolanaTokenAccountInfo: Codable, Sendable {
    
    /// The address of the token account.
    public var address: String
    
    /// The token balance of an SPL Token account.
    public var tokenBalance: ACSolanaTokenAccountBalance
    
    /// Creating a instance of ACSolanaTokenAccountInfo which  represents the account information of a particular SPL Token.
    /// - Parameters:
    ///   - address: The address of the token account.
    ///   - tokenBalance: The token balance of an SPL Token account.
    public init(address: String, tokenBalance: ACSolanaTokenAccountBalance) {
        self.address = address
        self.tokenBalance = tokenBalance
    }
    
    public enum CodingKeys: String, CodingKey {
        case address, amount, decimals, uiAmount, uiAmountString
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decode(String.self, forKey: .address)
        let amount = try container.decode(String.self, forKey: .amount)
        let decimals = try container.decode(UInt8.self, forKey: .decimals)
        let uiAmount = try container.decodeIfPresent(Double.self, forKey: .uiAmount)
        let uiAmountString = try container.decode(String.self, forKey: .uiAmountString)
        self.tokenBalance = ACSolanaTokenAccountBalance(amount: amount,
                                                        decimals: decimals,
                                                        uiAmount: uiAmount,
                                                        uiAmountString: uiAmountString)
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.tokenBalance.amount, forKey: .amount)
        try container.encode(self.tokenBalance.decimals, forKey: .decimals)
        try container.encodeIfPresent(self.tokenBalance.uiAmount, forKey: .uiAmount)
        try container.encode(self.tokenBalance.uiAmountString, forKey: .uiAmountString)
    }
}
