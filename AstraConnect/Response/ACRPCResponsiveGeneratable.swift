//
//  ACRPCRespBuilderGeneratable.swift
//  AstraConnect
//
//  Created by scott on 2025/11/3.
//

import Foundation

/// A  protocol used for gengerate a ACRPCResponsive according to data(any ACRPCDataRepresentable).
public protocol ACRPCResponsiveGeneratable {
    
    /// Gengerating a ACRPCResponsiveBuildable according to any ACRPCDataRepresentable.
    /// - Parameters:
    ///   - dataInfo: The corresponding RPC data information.
    ///   - result: The corresponding result type.
    /// - Returns: The corresponding ACRPCResponsive.
    static func generate<Result: Decodable>(by dataInfo: any ACRPCDataRepresentable.Type,
                                            with result: Result.Type) -> (any ACRPCResponsive<Result>.Type)?
}
