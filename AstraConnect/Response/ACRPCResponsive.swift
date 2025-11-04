//
//  ACResponsive.swift
//  AstraConnect
//
//  Created by scott on 2025/11/2.
//

import Foundation

/// A protocol represents the RPC response.
public protocol ACRPCResponsive<Result>: Decodable {
    
    associatedtype Result: Decodable
    
    associatedtype Error: Decodable
    
    /// The result contained in a response if succeed.
    var result: Result? { get set }
    
    /// Error information if failed.
    var error: Error? { get set }
}
