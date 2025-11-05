//
//  ACURLRequestBuilderFactory.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// A factory build related ACURLRequestBuilder according to RequestWay.
public enum ACURLRequestBuilderFactory: ACURLRequestBuilderGeneratable {
    
    /// A map represents related ACURLRequestBuilders for different RequestWay.
    nonisolated(unsafe) public static let builderMap = [ACPOSTRequestWay.POSTMethodDesc: ACPOSTURLRequestBuilder()]
    
    /// Generate a ACURLRequestBuildable according to the RequestWay.
    /// - Parameter requestWay: Detailed way to send a request.
    /// - Returns: A Optional ACURLRequestBuildable, and will be nil if RequestWay not supported.
    public static func generateBuilder(by requestWay: any ACRequestWay) -> (any ACURLRequestBuildable)? {
        builderMap[requestWay.detail]
    }
    
}
