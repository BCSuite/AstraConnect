//
//  ACSolanaDataFilter.swift
//  AstraConnect
//
//  Created by scott on 2025/10/30.
//

import Foundation

/// A model used to filter RPC data.
public struct ACSolanaDataFilter: Codable {
    
    /// Comparing a provided series of bytes with program account data at a particular offset.
    public struct memCmp: Codable {
        
        /// Offset into program account data to start comparison.
        public var offset: UInt64
        
        /// Data to match, as encoded string
        public var bytes: String
        
        /// Encoding for filter bytes data, either "base58" or "base64". Data is limited in size to 128 or fewer decoded bytes.
        public var encoding: ACSolanaRPCAPI.encodingKind
        
        /// Creating a instance of memcmp which compares a provided series of bytes with program account data at a particular offset.
        /// - Parameters:
        ///   - offset: Offset into program account data to start comparison.
        ///   - bytes: Data to match, as encoded string
        ///   - encoding: Encoding for filter bytes data, either "base58" or "base64". Data is limited in size to 128 or fewer decoded bytes.
        public init(offset: UInt64, bytes: String, encoding: ACSolanaRPCAPI.encodingKind) {
            self.offset = offset
            self.bytes = bytes
            self.encoding = encoding
        }
    }
    
    /// Comparing a provided series of bytes with program account data at a particular offset.
    public var memcmp: memCmp?
    
    /// Comparing the program account data length with the provided data size.
    public var dataSize: UInt64?
    
    /// Creating a instance of ACSolanaDataFilter which used to filter RPC data..
    /// - Parameters:
    ///   - memcmp: Comparing a provided series of bytes with program account data at a particular offset.
    ///   - dataSize: Comparing the program account data length with the provided data size.
    public init(memcmp: memCmp? = nil, dataSize: UInt64? = nil) {
        self.memcmp = memcmp
        self.dataSize = dataSize
    }
}
