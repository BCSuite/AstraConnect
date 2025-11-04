//
//  ACSolanaRespBuilderDefaultFactory.swift
//  AstraConnect
//
//  Created by scott on 2025/11/3.
//

import Foundation

public typealias SolRespGenFactory = ACSolanaResponsiveDefaultFactory

/// The default RPC responsive factory generate a ACRPCResponsive.
public enum ACSolanaResponsiveDefaultFactory: ACRPCResponsiveGeneratable {
    
    /// The map store the relationship between the RPC data type and detailed ACRPCResponsiveBuildable.
    static let buildersMap = [ACRPCJSONData.typeName: ACSolanaJSONRPCResponseBuilder.self]
    
    /// Gengerating a detailed ACRPCResponsive according to corresponding data type.
    /// - Parameters:
    ///   - dataInfo: The corresponding RPC data information.
    ///   - result: The corresponding result type.
    /// - Returns: The corresponding ACRPCResponsive.
    public static func generate<Result: Decodable>(by dataInfo: any ACRPCDataRepresentable.Type,
                                                   with result: Result.Type) -> (any ACRPCResponsive<Result>.Type)? {
        guard let builder = buildersMap[dataInfo.typeName] else {
            return nil
        }
        return builder.build(with: result)
    }
}
