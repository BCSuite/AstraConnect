//
//  Requestable.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation


/// A protocol presents the RPC request when interacting with Chains.
public protocol ACRequestable {
     
    /// RPC information to send a request.
    var rpcInfo: any ACRPCPresentable { get set }
    
    /// The way to send a request.
    var requestWay: (any ACRequestWay) { get set }
}
