//
//  ACCoderGeneratable.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// A factory protocol to generate any ACCodable.
public protocol ACEncoderGeneratable {
    
    /// Generate any ACCodable according to ACRPCDataRepresentable.
    /// - Parameter dataInfo: Data informations.
    /// - Returns: any ACEncodable, nil if  the data is not supported.
    static func generateEncoder(by dataInfo: any ACRPCDataRepresentable.Type) -> (any ACEncodable)?
}
