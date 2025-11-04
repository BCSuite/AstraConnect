//
//  ACSolanaInnerInstructions.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//


import Foundation

/// The Solana runtime records the cross-program instructions that are invoked during transaction processing and makes
/// these available for greater transparency of what was executed on-chain per transaction instruction. Invoked instructions
/// are grouped by the originating transaction instruction and are listed in order of processing.
public struct ACSolanaInnerInstructions: Codable {
    
    /// Index of the transaction instruction from which the inner instruction(s) originated.
    public var index: UInt64
    
    /// Ordered list of inner program instructions that were invoked during a single transaction instruction.
    public var instructions: [ACSolanaInstruction]
    
    /// Create a instance of the InnerInstructions.
    /// - Parameters:
    ///   - index: Index of the transaction instruction from which the inner instruction(s) originated.
    ///   - instructions: Ordered list of inner program instructions that were invoked during a single transaction instruction.
    public init(index: UInt64, instructions: [ACSolanaInstruction]) {
        self.index = index
        self.instructions = instructions
    }
}
