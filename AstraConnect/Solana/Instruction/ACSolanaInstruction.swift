//
//  ACSolanaInstruction.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//


import Foundation

/// Program instructions that will be executed in sequence and committed in one atomic transaction if all succeed.
public struct ACSolanaInstruction: Codable, Sendable {
    
    ///  Index into the message.accountKeys array indicating the program account that executes this instruction.
    public var programIdIndex: UInt64?
    
    /// List of ordered indices into the message.accountKeys array indicating which accounts to pass to the program.
    public var accounts: [ACDynamicCodation]?
    
    /// The program input data encoded in a base-58 string.
    public var data: String?
    
    /// The stack height of the instruction.
    public var stackHeight: UInt64?
    
    public init(programIdIndex: UInt64?, accounts: [ACDynamicCodation]?, data: String?, stackHeight: UInt64? = nil) {
        self.programIdIndex = programIdIndex
        self.accounts = accounts
        self.data = data
        self.stackHeight = stackHeight
    }
}
