//
//  ACSolanaJSONRPCRequest.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation


/// A model represents the data strcuture of a Solana RPC request.
public struct ACSolanaJSONRPCRequest: ACRequestable {
    
    /// The way to send a request, the default is ACPOSTRequestWay.
    public var requestWay: any ACRequestWay
    
    /// RPC information to send a request.
    public var rpcInfo: any ACRPCPresentable
    
     
    /// Creating a instance of ACSolanaJSONRPCRequest which represents the data strcuture of a Solana RPC request.
    /// - Parameters:
    ///   - payload: All data, including parameters, used for a call.
    ///   - rpcAddress: Remotes address of RPC service.
    ///   - methodName: Requested methods or properties.
    public init(payload: ACSolanaJSONRPCRequestPayload,
                rpcAddress: String,
                methodName: String,
                requestWay: any ACRequestWay = ACPOSTRequestWay()) {
        self.requestWay = requestWay
        let rpcInfo = ACSolanaRPC(address: rpcAddress,
                                  accessedContent: methodName,
                                  payload: payload,
                                  dataInfo: ACRPCJSONData.self)
        self.rpcInfo = rpcInfo
    }
    
    /// Creating a instance of ACSolanaJSONRPCRequest which represents the data strcuture of a Solana RPC request.
    /// - Parameters:
    ///   - requestWay: The way to send a request, can be any that conforms to the ACPOSTRequestWay protocol and the default is ACPOSTRequestWay.
    ///   - rpcInfo: RPC information  used to send a request, can be any that conforms to the ACRPCPresentable protocol.
    public init(requestWay: any ACRequestWay = ACPOSTRequestWay(), rpcInfo: any ACRPCPresentable) {
        self.requestWay = requestWay
        self.rpcInfo = rpcInfo
    }
    
}
