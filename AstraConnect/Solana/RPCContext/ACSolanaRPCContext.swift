//
//  ACSolanaRPContext.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//

import Foundation


/// A model which represents context data.
public struct ACSolanaRPCContext: Codable {
    
    /// The API vsersion.
    let apiVersion: String?
    
    /// Corresponding slot.
    let slot: UInt64?
    
    /// Create a instance of ACSolanaRPContext
    /// - Parameters:
    ///   - apiVersion: The API vsersion.
    ///   - slot: Corresponding slot.
    public init(apiVersion: String? = nil, slot: UInt64? = nil) {
        self.apiVersion = apiVersion
        self.slot = slot
    }
}
