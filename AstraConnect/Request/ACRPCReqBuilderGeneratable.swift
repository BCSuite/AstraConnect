//
//  ACSolanaRPCReqBuilderGeneratable.swift
//  AstraConnect
//
//  Created by scott on 2025/11/3.
//

import Foundation


/// A facroty protocol  to gererate any RPC request builder.
public protocol ACRPCReqBuilderGeneratable {
    
    /// Generate any ACRPCRequestBuildable according to data type
    /// - Parameter dataInfo: Detailed data information.
    /// - Returns: Any builder conforms to the ACRPCRequestBuildable protocol.
    static func generateBuilder(by dataInfo: any ACRPCDataRepresentable.Type) -> (any ACRPCRequestBuildable.Type)?
}
