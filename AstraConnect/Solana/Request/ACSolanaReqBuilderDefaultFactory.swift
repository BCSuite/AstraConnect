//
//  ACSolanaReqBuilderDefaultFactory.swift
//  AstraConnect
//
//  Created by scott on 2025/11/3.
//

import Foundation

public typealias SolReqGenFactory = ACSolanaReqBuilderDefaultFactory

public enum ACSolanaReqBuilderDefaultFactory: ACRPCReqBuilderGeneratable {
    
    /// Builder map store relationships betweeen  data type and  ACRPCRequestBuildable type.
    static let buildersMap: [String: any ACRPCRequestBuildable.Type] = [ACRPCJSONData.typeName: ACSolanaJSONReqBuilder.self]
    
    /// Generate any ACRPCRequestBuildable according to data type
    /// - Parameter dataInfo: Detailed data information.
    /// - Returns: Any builder conforms to the ACRPCRequestBuildable protocol.
    public static func generateBuilder(by dataInfo: any ACRPCDataRepresentable.Type) -> (any ACRPCRequestBuildable.Type)? {
        guard let builder = buildersMap[dataInfo.typeName] else {
            return nil
        }
        return builder
    }
}
