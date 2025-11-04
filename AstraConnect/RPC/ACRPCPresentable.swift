//
//  RPCPresentation.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation

/// RPC informations when make a RPC call
public protocol ACRPCPresentable {
        
    /// Remotes address of RPC service.
    var address: String { get set }
    
    /// Requested methods or properties.
    var accessedContent: String { get }
    
    /// All data, including parameters, used for a call.
    var payload: any Encodable { get set }
    
    /// Version of different RPC format.
    var version: String? { get set }
    
    /// Informations about Data transfered between RPC and native client.
    var dataInfo: any ACRPCDataRepresentable.Type { get set}
}
