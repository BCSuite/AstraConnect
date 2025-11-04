//
//  ACSolanaTx.swift
//  AstraConnect
//
//  Created by scott on 2025/10/24.
//


import Foundation

/*
 "transaction": {
   "message": {
     "accountKeys": [
       "EF3cbGuhJus5mCdGZkVz7GQce7QHbswBhZu6fmK9zkCR",
       "4LAyP5B5jNyNm7Ar2dG8sNipEiwTMEyCHd1iCHhhXYkY",
       "11111111111111111111111111111111"
     ],
     "header": {
       "numReadonlySignedAccounts": 0,
       "numReadonlyUnsignedAccounts": 1,
       "numRequiredSignatures": 1
     },
     "instructions": [
       {
         "accounts": [
           0,
           1
         ],
         "data": "3Bxs411Dtc7pkFQj",
         "programIdIndex": 2,
         "stackHeight": null
       }
     ],
     "recentBlockhash": "6pw7JBwq9tb5GHiBQgVY6RAp5otbouwYvEc1kbbxKFec"
   },
   "signatures": [
     "2M8mvwhtxyz3vAokXESVeR9FQ4t9QQxF5ek6ENNBBHVkW5XyZvJVK5MQej5ccwTZH6iWBJJoZ2CcizBs89pvpPBh"
   ]
 }
 */
/// A model represents data structure of a Solana transaction. Deatails are shown as above. official doc is:
///  https://solana.com/docs/rpc/json-structures#transactions
public struct ACSolanaTx: Codable {
    
    /// Defines the content of the transaction. If set the 'transactionDetails' param to 'accounts' when requesting, this will not be returned.
    public var message: ACSolansTxMessage?
    
    /// A list of base-58 encoded signatures applied to the transaction. The list is always of length message.header.numRequiredSignatures
    /// and not empty. The signature at index i corresponds to the public key at index i in message.accountKeys
    public var signatures: [String]
    
    public init(message: ACSolansTxMessage?, signatures: [String]) {
        self.message = message
        self.signatures = signatures
    }
    
}
