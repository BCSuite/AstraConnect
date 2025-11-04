//
//  ACCoderFactory.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// The default factory generate a ACDecodable used to encode value of origin type.
public enum ACCoderDefaultFactory: ACEncoderGeneratable {
    
    /// A map represents related ACURLRequestBuilders for different data.
    public static let coderMap: [String: any ACEncodable] = [ACRPCJSONData.typeName: ACJSONCoder()]
    
    /// Generate any ACCodable according to ACRPCDataRepresentable.
    /// - Parameter dataInfo: Data informations.
    /// - Returns: any ACDecodable, nil if  the data is not supported.
    public static func generateEncoder(by dataInfo: any ACRPCDataRepresentable.Type) -> (any ACEncodable)? {
        coderMap[dataInfo.typeName]
    }
    
}
