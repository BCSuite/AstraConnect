//
//  ACDecoderFactory.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation


/// The default factory generate a ACDecodable according to data.
public enum ACDecoderDefaultFactory: ACDecoderGeneratable {
    
    /// A map represents related ACURLRequestBuilders for different data.
    nonisolated(unsafe) public static let decoderMap = [ACRPCJSONData.typeName: ACJSONDecoder()]
    
    /// Generate any ACDecodable according to ACRPCDataRepresentable.
    /// - Parameter dataInfo: Data informations.
    /// - Returns: Any ACDecodable, nil if  the data is not supported.
    public static func generate(by dataInfo: any ACRPCDataRepresentable.Type) -> (any ACDecodable)? {
        decoderMap[dataInfo.typeName]
    }
    
}
