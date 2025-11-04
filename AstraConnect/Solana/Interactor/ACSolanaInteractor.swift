//
//  ACSolanaInteractor.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

public struct ACSolanaInteractor: ACChainInteractable {
    
    /// RPC address be rquested.
    public var rpcAddress: String
    
    /// The requester that sends a RPC request.
    public var requester: any ACRequestCapability
    
    /// The logger records informations if needed, default value is nil.
    public var logger: (any ACLoggable)?
    
    /// Creating a instance of ACSolanaInteractor.
    /// - Parameters:
    ///   - rpcAddress: RPC address be rquested.
    ///   - requester: The requester that sends a RPC request, can be any that conforms to the ACRequestCapability protocol.
    ///   - logger: The logger records informations if needed, default value is nil.
    public init(rpcAddress: String, requester: any ACRequestCapability, logger: (any ACLoggable)? = nil) {
        self.rpcAddress = rpcAddress
        self.requester = requester
        self.logger = logger
    }
    
    /// Interact with the Solana chain by send a request.
    /// - Parameter request: Detailed request information.
    /// - Returns: Resonse data from chains.
    public func interact<Response>(by request: any ACRequestable) async throws -> Response where Response : Decodable {
        let response: Response
        do {
            response = try await requester.request(request)
        } catch {
            let methodName = request.rpcInfo.accessedContent
            logger?.log("\(methodName):\(error)")
            throw error
        }
        return response
    }
}

