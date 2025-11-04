//
//  ACSolanaLatestBlockInfo.swift
//  AstraConnect
//
//  Created by scott on 2025/10/30.
//

import Foundation

/*
 {
 "blockhash": "4gTBW8igGw7FdhJ3rdqAN6fyfbrWtTEYD2eSm5MvaEZw",
 "lastValidBlockHeight": 405969402
 }
 */
/// A model represents the latest block informations. The official doc is https://solana.com/docs/rpc/http/getlatestblockhash.
public struct ACSolanaLatestBlockInfo: Codable {
    
    /// A Hash as base-58 encoded string.
    public var blockhash: String
    
    /// Last block height at which the blockhash will be valid.
    public var lastValidBlockHeight: UInt64
    
    /// Creating a instance of ACSolanaLatestBlockInfo which represents the latest block informations
    /// - Parameters:
    ///   - blockhash: A Hash as base-58 encoded string.
    ///   - lastValidBlockHeight: Last block height at which the blockhash will be valid.
    public init(blockhash: String, lastValidBlockHeight: UInt64) {
        self.blockhash = blockhash
        self.lastValidBlockHeight = lastValidBlockHeight
    }
}
