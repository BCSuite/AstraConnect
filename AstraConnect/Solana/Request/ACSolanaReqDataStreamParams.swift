//
//  ACSolanaReqDataStreamParams.swift
//  AstraConnect
//
//  Created by scott on 2025/11/3.
//

import Foundation


public typealias ACSolReqDSP = ACSolanaReqDataStreamParams

/// A model represents data stream associated params for the Solana RPC request.
public struct ACSolanaReqDataStreamParams: ACRequestDataStreamAssociation {
    
    /// Detailed data information including data type, and default value is ACRPCJSONData.self.
    public var dataInfo: any ACRPCDataRepresentable.Type
    
    /// The generator gengerates a ACRPCRequestBuildable according to different data, the default value is ACSolanaReqBuilderDefaultFactory.self.
    public var reqGenerator: any ACRPCReqBuilderGeneratable.Type
    
    /// The generator gengerates a ACRPCResponsive according to different data, the default value is ACSolanaResponsiveDefaultFactory.self.
    public var respGenerator: any ACRPCResponsiveGeneratable.Type
    
    /// Creating a instance of ACSolanaReqDataStreamParams which represent  data stream associated params for the Solana RPC request.
    /// - Parameters:
    ///   - dataInfo: Detailed data information including data type, and default value is ACRPCJSONData.self.
    ///   - reqGenerator: The generator gengerates a ACRPCRequestBuildable according to different data, the default value is ACSolanaReqBuilderDefaultFactory.self.
    ///
    ///   - respGenerator: The generator gengerates a ACRPCResponsive according to different data, the default value is ACSolanaResponsiveDefaultFactory.self.
    public init(dataInfo: any ACRPCDataRepresentable.Type = ACRPCJSONData.self,
                reqGenerator: any ACRPCReqBuilderGeneratable.Type =  SolReqGenFactory.self,
                respGenerator: any ACRPCResponsiveGeneratable.Type = SolRespGenFactory.self) {
        self.dataInfo = dataInfo
        self.reqGenerator = reqGenerator
        self.respGenerator = respGenerator
    }
}
