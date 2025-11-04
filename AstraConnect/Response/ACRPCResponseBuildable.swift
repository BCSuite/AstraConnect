//
//  ACRPCResponsiveBuildable.swift
//  AstraConnect
//
//  Created by scott on 2025/11/3.
//

import Foundation

///  A protocol mainly used for build  a detailed response conforms to the ACRPCResponsive,
public protocol ACRPCResponseBuildable {
    
    /// Building any ACRPCResponsive with corresponding result type.
    /// - Parameter result: The corresponding result type.
    /// - Returns: Any ACRPCResponsive.
    static func build<Result: Decodable>(with result: Result.Type) -> any ACRPCResponsive<Result>.Type
}
