//
//  ACSolanaTokenAccountOwnershipParams.swift
//  AstraConnect
//
//  Created by scott on 2025/11/1.
//


/// A model represents the ownership related information for a  token Account.
    public struct ACSolanaTokenAccountOwnershipParams: Codable {
        
        /// Pubkey of the specific token Mint to limit accounts to, as base-58 encoded string.
        public var mint: String?
        
        /// Pubkey of the Token program that owns the accounts, as base-58 encoded string.
        public var programId: String?
        
        /// Creating a instance of ACSolanaGetTokenAccountsByDelegate.OwnershipParams which represents informations about
        /// the Solana getTokenAccountsByDelegate RPC API.
        /// - Parameters:
        ///   - mint: Pubkey of the specific token Mint to limit accounts to, as base-58 encoded string.
        ///   - programId: Pubkey of the Token program that owns the accounts, as base-58 encoded string.
        public init(mint: String? = nil, programId: String? = nil) {
            self.mint = mint
            self.programId = programId
        }
    }
