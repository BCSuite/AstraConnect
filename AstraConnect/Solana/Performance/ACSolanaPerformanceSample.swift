//
//  ACSolanaPerformanceSample.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation

/*
{
   "numNonVoteTransactions": 2307,
   "numSlots": 155,
   "numTransactions": 4330,
   "samplePeriodSecs": 60,
   "slot": 418249894
 }
 */
/// A model represents recent performance sample taken every 60 seconds and include the number of
/// transactions and slots that occur in a given time window.
/// The official doc is https://solana.com/docs/rpc/http/getrecentperformancesamples.
public struct ACSolanaPerformanceSample: Codable, Sendable {
    
    /// Number of non-vote transactions processed during the sample period.
    public var numNonVoteTransactions: UInt64
    
    /// Number of slots completed during the sample period.
    public var numSlots: UInt64
    
    /// Number of transactions processed during the sample period.
    public var numTransactions: UInt64
    
    /// Number of seconds in a sample window.
    public var samplePeriodSecs: UInt64
    
    /// Slot in which sample was taken at.
    public var slot: UInt64
    
    /// Creating a instance of ACSolanaPerformanceSample which represents recent performance sample.
    /// - Parameters:
    ///   - numNonVoteTransactions: Number of non-vote transactions processed during the sample period.
    ///   - numSlots: Number of slots completed during the sample period.
    ///   - numTransactions: Number of transactions processed during the sample period.
    ///   - samplePeriodSecs: Number of seconds in a sample window.
    ///   - slot: Slot in which sample was taken at.
    public init(numNonVoteTransactions: UInt64,
                numSlots: UInt64,
                numTransactions: UInt64,
                samplePeriodSecs: UInt64,
                slot: UInt64) {
        self.numNonVoteTransactions = numNonVoteTransactions
        self.numSlots = numSlots
        self.numTransactions = numTransactions
        self.samplePeriodSecs = samplePeriodSecs
        self.slot = slot
    }
}
