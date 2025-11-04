//
//  ACPOSTURLRequestBuilder.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation

/// Building a URLRequest which uses POST to send a request.
public struct ACPOSTURLRequestBuilder: ACURLRequestBuildable {
    
    /// The generator that generate related coder according to data, and the default value is ACCoderDefaultFactory.self.
    private let coderGenerator: ACEncoderGeneratable.Type
    
    /// The generator that generate related ACHTTPContentFormattable according to data, and
    /// the default value is ACHTTPContentFormatterFactory.self.
    private let cntFmterGenerator: ACHTTPContentFormatterGeneratable.Type
    
    /// Create a ACPOSTURLRequestBuilder instance.
    /// - Parameter coderGenerator: The generator that generate related coder according to data, and the default value is ACCoderFactory.self.
    /// - Parameter cntFmterGenerator: The generator that generate related ACHTTPContentFormattable according to data, and
    /// the default value is ACHTTPContentFormatterFactory.self.
    public init(coderGenerator: ACEncoderGeneratable.Type = ACCoderDefaultFactory.self,
                cntFmterGenerator: ACHTTPContentFormatterGeneratable.Type = ACHTTPContentFormatterFactory.self) {
        self.coderGenerator = coderGenerator
        self.cntFmterGenerator = cntFmterGenerator
    }
        
    /// Building a URLRequest according to the Requestable.
    /// - Parameters:
    ///   - info: Information described by a Requestable.
    /// - Returns: A URLRequest instance.
    public func build(from info: any ACRequestable) throws -> URLRequest {
        let address = info.rpcInfo.address
        //1.Generate related URL.
        guard let url = URL(string: info.rpcInfo.address) else {
            let requestErrorKind = ACRPCProcessErrorKind.invalidURL
            throw requestErrorKind.buildError(entity: String(describing: self), msg: address)
        }
        //2.Generate the URLRequest instance.
        var urlRq = URLRequest(url: url)
        //3.Set the way of sending a request.
        urlRq.httpMethod = ACPOSTRequestWay.POSTMethodDesc
        //4.Set the "Content-Type".
        let dataInfo = info.rpcInfo.dataInfo
        guard let contentType = cntFmterGenerator.generateFormatter(by: dataInfo)?.type else {
            throw ACRPCProcessErrorKind.unsupportedDataType.buildError(entity: String(describing: Self.self),
                                                                       msg: dataInfo.typeName)
        }
        urlRq.setValue(contentType, forHTTPHeaderField: ACRequestSpace.ACHTTPCTField)
        //4.Serialize the "Content-Type".
        guard let coder = coderGenerator.generateEncoder(by: dataInfo) else {
            throw ACRPCProcessErrorKind.unsupportedDataType.buildError(entity: String(describing: Self.self),
                                                                       msg: dataInfo.typeName)
        }
        urlRq.httpBody = try coder.encode(info.rpcInfo.payload)
        return urlRq
    }
}
