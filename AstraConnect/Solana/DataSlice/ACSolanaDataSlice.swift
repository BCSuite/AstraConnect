//
//  ACSolanaDataSlice.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//


import Foundation

/// The data structure to represents a slice of the data.
public struct ACSolanaDataSlice: Codable {
    
    /// Number of bytes to return
    public var length: UInt64
    
    /// Byte offset from which to start reading
    public var offset: UInt64
    
    /// Creating a instance of dataSlice.
    /// - Parameters:
    ///   - length: Number of bytes to return
    ///   - offset: Byte offset from which to start reading
    public init(length: UInt64, offset: UInt64) {
        self.length = length
        self.offset = offset
    }
}
