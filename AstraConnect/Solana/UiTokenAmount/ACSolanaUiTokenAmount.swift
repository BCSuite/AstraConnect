//
//  ACSolanaUiTokenAmount.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//


import Foundation

/*
 "uiTokenAmount": {
     "amount": "0",
     "decimals": 2,
     "uiAmount": null,
     "uiAmountString": "0"
 }
 */

/// Amount informations related informations of a token. The official doc is:
/// https://solana.com/docs/rpc/json-structures#token-balances
public struct ACSolanaUiTokenAmount: Codable, Sendable {
    
    /// Raw amount of tokens as a string, ignoring decimals.
    public var amount: String
    
    ///  Number of decimals configured for token's mint.
    public var decimals: UInt64
    
    /// Token amount as a string, accounting for decimals.
    public var uiAmountString: String
    
    /// Creating a instance of UiTokenAmount which represents amount informations related informations of a token.
    /// - Parameters:
    ///   - amount: Raw amount of tokens as a string, ignoring decimals.
    ///   - decimals: Number of decimals configured for token's mint.
    ///   - uiAmountString: Token amount as a string, accounting for decimals.
    public init(amount: String, decimals: UInt64, uiAmountString: String) {
        self.amount = amount
        self.decimals = decimals
        self.uiAmountString = uiAmountString
    }
}
