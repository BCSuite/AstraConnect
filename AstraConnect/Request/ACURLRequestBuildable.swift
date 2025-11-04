//
//  ACURLRequestBuildable.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation

/// The builder that generates  a URLRequest.
public protocol ACURLRequestBuildable {
    
    /// Building a URLRequest according to the Requestable.
    /// - Parameters:
    ///   - info: Information described by a Requestable.
    /// - Returns: A URLRequest instance.
    func build(from info: any ACRequestable) throws -> URLRequest
}

