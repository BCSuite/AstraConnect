//
//  ACSolanaProduction.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//

import Foundation

/*
 "result": {
     "context": {
       "slot": 9887
     },
     "value": {
       "byIdentity": {
         "85iYT5RuzRTDgjyRa3cP8SYhM2j21fj7NhfJ3peu1DPr": [9888, 9886]
       },
       "range": {
         "firstSlot": 0,
         "lastSlot": 9887
       }
     }
   },
 */
/// A model represents block production information. Deatails are shown as above.
public struct ACSolanaProduction: Codable, Sendable {
    
    /// A dictionary of validator identities, as base-58 encoded strings. Value is a two element array
    /// containing the number of leader slots and the number of blocks produced.
    public var byIdentity: [String: [UInt64]]
    
    /// Block production slot range.
    public var range: ACSolanaSlotRange
    
    /// Creating a instance of ACSolanaProduction which represents block production information.
    /// - Parameters:
    ///   - byIdentity: A dictionary of validator identities.
    ///   - range: Block production slot range.
    public init(byIdentity: [String : [UInt64]], range: ACSolanaSlotRange) {
        self.byIdentity = byIdentity
        self.range = range
    }
}
