//
//  RequestCapability.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation

///  The capability to send a RPC request.
public protocol ACRequestCapability {
    
    /// Sending a request to chains.
    /// - Parameter request: Detailed request information.
    /// - Returns: Resonse data from chains.
    func request<Response: Decodable>(_ request: any ACRequestable) async throws -> Response
}
