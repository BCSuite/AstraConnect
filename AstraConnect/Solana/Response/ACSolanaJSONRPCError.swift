//
//  ACSolanaJSONRPCError.swift
//  AstraConnect
//
//  Created by scott on 2025/11/2.
//


import Foundation

/*
 {
   "jsonrpc": "2.0",
   "id":      1,                     // same id as the request (or null)
   "error": {
     "code":    -32602,               // **Integer** – required
     "message": "Invalid params",    // **String**  – required
     "data":    "missing address"    // **Any**    – optional
   }
 }
 */
/// A  model represents  the data structure of Salana JSON RPC error, its layout is shown as above:
public struct ACSolanaJSONRPCError: Codable, Error, LocalizedError {
    
    /// Detailed error code.
    public let code: Int
    
    /// Detailed error description.
    public let message: String
    
    /// Related data, may  be a string or an object.
    public let data: ACDynamicCodation?
    
    public enum CodingKeys: String, CodingKey {
        case code, message, data
    }
    
    public var errorDescription: String? {
        localizedDescription
    }
    
    public var localizedDescription: String {
        "\(code): \(message)"
    }
    
    /// Creating a instance of ACSolanaJSONRPCError which represents  the data structure of Salana JSON RPC error.
    /// - Parameters:
    ///   - code: Detailed error code.
    ///   - message: Detailed error description.
    ///   - data: Related data.
    public init(code: Int, message: String, data: ACDynamicCodation?) {
        self.code = code
        self.message = message
        self.data = data
    }
}
