//
//  ACSolanaRPC.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation


/// A model represents the data structure of Solana RPC.
public struct ACSolanaRPC: ACRPCPresentable {
    
    /// Remotes address of RPC service.
    public var address: String
    
    /// Requested methods or properties.
    public var accessedContent: String
    
    /// All data, including parameters, used for a call.
    public var payload: any Encodable
    
    /// Version of different RPC format.
    public var version: String?
    
    /// Informations about Data transfered between RPC and native client.
    public var dataInfo: any ACRPCDataRepresentable.Type
    
    /// Creating a instance of ACSolanaRPC which represents the data structure of Solana RPC.
    /// - Parameters:
    ///   - address: Remotes address of RPC service.
    ///   - accessedContent:  Requested methods or properties.
    ///   - payload: All data, including parameters, used for a call.
    ///   - version: Version of different RPC format.
    ///   - dataInfo: Informations about Data transfered between RPC and native client.
    public init(address: String,
                accessedContent: String,
                payload: any Encodable,
                version: String? = nil,
                dataInfo: any ACRPCDataRepresentable.Type = ACRPCJSONData.self) {
        self.address = address
        self.accessedContent = accessedContent
        self.payload = payload
        self.version = version
        self.dataInfo = dataInfo
    }
    
}
