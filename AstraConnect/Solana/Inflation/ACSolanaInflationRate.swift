//
//  ACSolanaInflationRate.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation

/*
 {
 "total": 0.149,
 "validator": 0.148,
 "foundation": 0.001,
 "epoch": 100
 }
 */
/// A model represents specific inflation values for the current epoch.
/// The official doc is https://solana.com/docs/rpc/http/getinflationgovernor.
public struct ACSolanaInflationRate: Codable {
    
    /// Total inflation.
    public var total: Double
    
    /// Inflation allocated to validators.
    public var validator: Double
    
    /// Inflation allocated to the foundation.
    public var foundation: Double
    
    /// Epoch for which these values are valid.
    public var epoch: UInt64
    
    /// Creating a instance of ACSolanaInflationRate which represents specific inflation values for the current epoch.
    /// - Parameters:
    ///   - total: Total inflation.
    ///   - validator: Inflation allocated to validators.
    ///   - foundation: Inflation allocated to the foundation.
    ///   - epoch: Epoch for which these values are valid.
    public init(total: Double, validator: Double, foundation: Double, epoch: UInt64) {
        self.total = total
        self.validator = validator
        self.foundation = foundation
        self.epoch = epoch
    }
}
