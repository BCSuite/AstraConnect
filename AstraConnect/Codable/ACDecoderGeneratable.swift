//
//  ACDecoderBuildable.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// A factory protocol to generate any ACDecodable.
public protocol ACDecoderGeneratable {
    
    /// Generate any ACDecodable according to ACRPCDataRepresentable.
    /// - Parameter dataInfo: Data informations.
    /// - Returns: any ACDecodable, nil if  the data is not supported.
    static func generate(by dataInfo: any ACRPCDataRepresentable.Type) -> (any ACDecodable)?
}
