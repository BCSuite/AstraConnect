//
//  ACRequestdataStreamParams.swift
//  AstraConnect
//
//  Created by scott on 2025/11/3.
//

import Foundation

public typealias ACReqDSA = ACRequestDataStreamAssociation

/// A protocol represents data stream associated params  for a RPC request.
public protocol ACRequestDataStreamAssociation {
    
    /// Detailed data information including data type.
    var dataInfo: any ACRPCDataRepresentable.Type { get set }
    
    /// The generator gengerates a ACRPCRequestBuildable according to different data.
    var reqGenerator: any ACRPCReqBuilderGeneratable.Type { get set }
    
    /// The generator gengerates a ACRPCResponsive according to different data.
    var respGenerator: any ACRPCResponsiveGeneratable.Type { get set }
}
