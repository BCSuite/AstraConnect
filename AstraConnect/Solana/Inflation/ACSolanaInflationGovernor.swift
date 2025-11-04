//
//  ACSolanaInflationGovernor.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation

/*
 {
 "foundation": 0.05,
 "foundationTerm": 7,
 "initial": 0.15,
 "taper": 0.15,
 "terminal": 0.015
 }
 */
/// A model represents the informations of the current inflation governor.
/// The official doc is https://solana.com/docs/rpc/http/getinflationgovernor
public struct ACSolanaInflationGovernor: Codable {
    
    /// Percentage of total inflation allocated to the foundation.
    public var foundation: Double
    
    /// Duration of foundation pool inflation in years.
    public var foundationTerm: Double
    
    /// Initial inflation percentage from time 0.
    public var initial: Double
    
    /// Rate per year at which inflation is lowered. (Rate reduction is derived using the target slot time in genesis config).
    public var taper: Double
    
    /// Terminal inflation percentage.
    public var terminal: Double
    
    /// Creating a instance of ACSolanaInflationGovernor which represents the informations of the current inflation governor.
    /// - Parameters:
    ///   - foundation: Percentage of total inflation allocated to the foundation.
    ///   - foundationTerm: Duration of foundation pool inflation in years.
    ///   - initial: Initial inflation percentage from time 0.
    ///   - taper: Rate per year at which inflation is lowered. (Rate reduction is derived using the target slot time in genesis config).
    ///   - terminal: Terminal inflation percentage.
    public init(foundation: Double, foundationTerm: Double, initial: Double, taper: Double, terminal: Double) {
        self.foundation = foundation
        self.foundationTerm = foundationTerm
        self.initial = initial
        self.taper = taper
        self.terminal = terminal
    }
}
