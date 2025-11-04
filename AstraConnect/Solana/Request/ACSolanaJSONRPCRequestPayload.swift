//
//  ACSolanaRequest.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// Fromate of Solana's JSON RPC request is presented as bellow:
/**
 {
  "jsonrpc": "2.0",
  "id": 1,
  "method": "getAccountInfo",
  "params": [
    "vines1vzrYbzLMRdu58ou5XTby4qAqVRLmqo36NKPTg",
    {
      "commitment": "finalized",
      "encoding": "base58"
    }
  ]
}*/


/// A  model represents Salana's JSON RPC data structure.
public struct ACSolanaJSONRPCRequestPayload {
    
    /// RPC data description.
    public let jsonRPC: String
    
    /// RPC data id.
    public let id: Int
    
    /// Requested method.
    public let method: String
    
    /// Related  params to a request.
    public let params: [any Encodable]?
    
    /// Creating a instance of ACSolanaJSONRPCRequestPayload which epresents Salana's JSON RPC data structure.
    /// - Parameters:
    ///   - jsonRPC: RPC data description.
    ///   - id: RPC data id.
    ///   - method: Requested method.
    ///   - params: Related  params to a request.
    public init(jsonRPC: String = ACSolanaRequestSpace.ACSolanaRPCTypeVersion,
                id: Int = ACSolanaRequestSpace.ACSolanaRPCIDValue,
                method: String,
                params: [any Encodable]?) {
        self.jsonRPC = jsonRPC
        self.id = id
        self.method = method
        self.params = params
    }
    
}

//MARK: -Encodable
extension ACSolanaJSONRPCRequestPayload: Encodable {
    enum CodingKeys: String, CodingKey {
        case jsonrpc, method, params, id
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(jsonRPC, forKey: .jsonrpc)
        try container.encode(method, forKey: .method)
        try container.encode(id, forKey: .id)
        
        // Handle params as Any
        guard let params = params else {
            return
        }
        var paramsContainer = container.nestedUnkeyedContainer(forKey: .params)
        for param in params {
            try paramsContainer.encode(param)
        }
    }
}


