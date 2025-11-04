//
//  ACSolanaNodeIdentity.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation
 
/// A model represents identity informations of current node. The offical doc is https://solana.com/docs/rpc/http/getidentity.
public struct ACSolanaNodeIdentity: Codable {
    
    /// The identity pubkey of the current node (as a base-58 encoded string).
    public var identity: String
    
    /// Creating a instance of ACSolanaNodeIdentity which  represents identity informations of current node.
    /// - Parameter identity: The identity pubkey of the current node (as a base-58 encoded string).
    public init(identity: String) {
        self.identity = identity
    }
}
