//
//  URLSessionRequester.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation


/// A requester internally uses the URLSession to send a request.
public struct URLSessionRequester: ACRequestCapability {
    
    /// The generator that generates a ACURLRequestBuilder, and the default value is ACURLRequestBuilderFactory.self
    public var reqBuilderGenerator: any ACURLRequestBuilderGeneratable.Type
    
    /// A  generator generates a  decoder that decodes the response data, and the default value is ACDecoderDefaultFactory.
    public var decoderGenerator: any ACDecoderGeneratable.Type
    
    /// Creating a instance of URLSessionRequester, which internally uses the URLSession to send a request.
    /// - Parameters:
    ///   - urlRequestBuilder: The builder to generate a URLRequest, can be any that conforms to the ACURLRequestBuildable
    ///    protocol and the default value is  ACPOSTURLRequestBuilder
    ///
    ///   - decoder: A decoder that decodes the response data,   can be any that conforms to the ACDecodable
    ///    protocol and the default value is ACJSONDecoder.
    public init(reqBuilderGenerator: any ACURLRequestBuilderGeneratable.Type = ACURLRequestBuilderFactory.self,
                decoderGenerator: any ACDecoderGeneratable.Type = ACDecoderDefaultFactory.self) {
        self.reqBuilderGenerator = reqBuilderGenerator
        self.decoderGenerator = decoderGenerator
    }
    
    /// Sending a request to chains.
    /// - Parameter request: Detailed request information.
    /// - Returns: Resonse data from chains.
    public func request<Response: Decodable>(_ request: any ACRequestable) async throws -> Response {
        // 1.Create a URLRequest
        guard let urlRequestBuilder = reqBuilderGenerator.generateBuilder(by: request.requestWay) else {
            throw ACRPCProcessErrorKind.unknownReqWay.buildError(entity: String(describing: Self.self),
                                                                 msg: request.requestWay.detail)
        }
        let urlRequest = try urlRequestBuilder.build(from: request)
        // 2.Send a request
        let (respData, response): (Data, URLResponse)
        do {
            (respData, response) = try await URLSession.shared.data(for: urlRequest)
        } catch {
            throw ACRPCProcessErrorKind.urlSessionTaskException.buildError(entity: String(describing: Self.self),
                                                                           msg: error.localizedDescription)
        }
        // 3.Check the status code.
        guard let httpResponse = response as? HTTPURLResponse else {
            // Non-HTTP Response
            throw ACRPCProcessErrorKind.nonHTTPResponse.buildError(entity: String(describing: Self.self),
                                                                   msg: response.description)
        }
        let statusCode = httpResponse.statusCode
        guard statusCode == ACRequestSpace.ACHTTPReuqestSuccessCode else {
            // Request failure.
            throw ACError(module: String(describing: self),
                          code: httpResponse.statusCode,
                          msg: HTTPURLResponse.localizedString(forStatusCode: statusCode))
        }
        //4.Decode the response data.
        let dataInfo = request.rpcInfo.dataInfo
        guard let decoder = decoderGenerator.generate(by: dataInfo) else {
            throw ACRPCProcessErrorKind.unsupportedDataType.buildError(entity: String(describing: Self.self),
                                                                    msg: dataInfo.typeName)
        }
        let decodedResponse: Response
        do {
            decodedResponse = try decoder.decode(to: Response.self, from: respData)
        } catch {
            throw ACRPCProcessErrorKind.responseDecodeFailed.buildError(entity: String(describing: Self.self),
                                                                        msg: "\(error)")
        }
        return decodedResponse
    }
}
