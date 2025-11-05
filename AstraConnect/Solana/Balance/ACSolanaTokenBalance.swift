//
//  ACSolanaTokenBalance.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//


import Foundation

/// Token informations including owner, amount and etc. The official doc is:
/// https://solana.com/docs/rpc/json-structures#token-balances
public struct ACSolanaTokenBalance: Codable, Sendable {
    
    ///  Index of the account in which the token balance is provided for.
    public var accountIndex: UInt64
    
    /// Pubkey of the token's mint.
    public var mint: String
    
    /// Pubkey of the Token program that owns the account.
    public var programId: String?
    
    /// Amount related informations of the token.
    public var uiTokenAmount: ACSolanaUiTokenAmount
    
    /// Creating a instance of TokenBalance which represents token informations including owner, amount and etc
    /// - Parameters:
    ///   - accountIndex: Index of the account in which the token balance is provided for.
    ///   - mint: Pubkey of the token's mint.
    ///   - programId: Pubkey of the Token program that owns the account.
    ///   - uiTokenAmount: Amount related informations of the token.
    public init(accountIndex: UInt64, mint: String, programId: String? = nil, uiTokenAmount: ACSolanaUiTokenAmount) {
        self.accountIndex = accountIndex
        self.mint = mint
        self.programId = programId
        self.uiTokenAmount = uiTokenAmount
    }
}
