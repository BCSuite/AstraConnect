//
//  ACSolanaUniRespResult.swift
//  AstraConnect
//
//  Created by scott on 2025/10/31.
//

import Foundation
  /*
 "result": {
     "context": {
       "apiVersion": "xxx",
       "slot": xxxx
     },
     "value": [
       xxxxx
     ]
   },
 */
/// A model represents the universal Solana RPC response result containing a context and value.
public struct ACSolanaUniRespResult<Value>: Codable where Value: Codable {
    
    /// RPC context.
    public var context: ACSolanaRPCContext
    
    /// Detailed value.
    public var value: Value
    
    /// Creating a instance of ACSolanaUniRespResult which represents the universal Solana RPC response result containing a context and value.
    /// - Parameters:
    ///   - context: RPC context.
    ///   - value: Detailed value.
    public init(context: ACSolanaRPCContext, value: Value) {
        self.context = context
        self.value = value
    }
}
