//
//  ACSolanaAccountInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//


import Foundation

/// A model represents Solana account information.
public struct ACSolanaAccountInfo: Codable, Sendable {
    
    /// Data associated with the account. Format depends on encoding parameter:
    /// 1.If the encoding parameter is left as the deprecated default of binary, this will be a string containing encoded binary data.
    /// 2.If base58, base64, or base64+zstd is specified, this will be an array, where the first element is the encoded
    /// data string and the second element is the encoding format. If jsonParsed is specified, this will be JSON format {<program>: <state>}.
    ///
    /// Because the response value may be different type, so using ACDynamicCodation to wrap.
    public var data: ACDynamicCodation
    
    /// Boolean indicating if the account contains a program (and is strictly read-only).
    public var executable: Bool
    
    /// Number of lamports assigned to this account.
    public var lamports: UInt64
    
    /// base-58 encoded Pubkey of the program this account has been assigned to.
    public var owner: String
    
    /// The epoch at which this account will next owe rent.
    public var rentEpoch: UInt64
    
    /// The data size of the account.
    public var space: UInt64
    
    /// Creaing a instance of ACSolanaAccountInfo which represents Solana account information.
    /// - Parameters:
    ///   - data: Data associated with the account.
    ///   - executable: Boolean indicating if the account contains a program (and is strictly read-only).
    ///   - lamports: Number of lamports assigned to this account.
    ///   - owner: base-58 encoded Pubkey of the program this account has been assigned to.
    ///   - rentEpoch: The epoch at which this account will next owe rent.
    ///   - space: The data size of the account.
    public init(data: ACDynamicCodation,
                executable: Bool,
                lamports: UInt64,
                owner: String,
                rentEpoch: UInt64,
                space: UInt64) {
        self.data = data
        self.executable = executable
        self.lamports = lamports
        self.owner = owner
        self.rentEpoch = rentEpoch
        self.space = space
    }
}
