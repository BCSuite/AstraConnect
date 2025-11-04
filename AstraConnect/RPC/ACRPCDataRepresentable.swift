//
//  RPCDataRepresentation.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// Represent RPC Data when interacting with chains, containing  data type. Extend other attributes if neeed in the future.
public protocol ACRPCDataRepresentable {
    
    /// Name of the detailed type.
    static var typeName: String { get }
}
