//
//  ACSolanaJSONRPCResponseModel.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/*
 {
   "jsonrpc": "2.0",
   "result": {
     "context": { "slot": 1 },
     "value": 0
   },
   "id": 1
 }
 */
/// A  model represents  the data structure of Salana JSON RPC response, its layout is shown as above:
public struct ACSolanaJSONRPCResponse<Result: Decodable>: ACRPCResponsive {
    
    /// The data format of Solana RPC.
    public let jsonrpc: String
    
    /// The id of Solana RPC data.
    public let id: Int?
    
    /// Detailed data returned by RPC.
    public var result: Result?
    
    /// Detailed error informations returned by RPC.
    public var error: ACSolanaJSONRPCError?    
    
    /// Creating a instance of ACSolanaJSONRPCResponse which represents  the data structure of Salana JSON RPC response.
    /// - Parameters:
    ///   - jsonRPC: The data format of Solana RPC.
    ///   - id: The id of Solana RPC data.
    ///   - result: Detailed data responed by RPC.
    ///   - error: Detailed error informations returned by RPC.
    public init(jsonrpc: String, id: Int?, result: Result?, error: ACSolanaJSONRPCError?) {
        self.jsonrpc = jsonrpc
        self.id = id
        self.result = result
        self.error = error
    }
}
    

