//
//  ACURLRequestBuilderGeneratable.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation


/// A facroty protocol  to gererate any ACURLRequestBuildable. In this way, it's easy to extend
///  custom facroty.
public protocol ACURLRequestBuilderGeneratable {
    
    /// Generate any ACURLRequestBuildable through which creates a  URLRequest.
    /// - Parameter requestWay: The way to send a request
    /// - Returns: Any ACURLRequestBuildable, will be nil if  RequestWay not supported.
    static func generateBuilder(by requestWay: any ACRequestWay) -> (any ACURLRequestBuildable)?
}
