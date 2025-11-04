//
//  ACChainInteractable.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

public protocol ACChainInteractable {
    
    /// Interact with chains by send a request.
    /// - Parameter request: Detailed request information.
    /// - Returns: Resonse data from chains.
    func interact<Response: Decodable>(by request: any ACRequestable) async throws -> Response
}

extension ACChainInteractable {
    
    /// Calling detailed RPC service and extracting result according to corresponding response type.
    /// - Parameters:
    ///   - request: The RPC request information used to make a RPC request to interact with Chains.
    ///   - responsive: The corresponding response type.
    /// - Returns: The corresponding result of the RPC response.
    public func callRPC<Responsive: ACRPCResponsive>(by request: any ACRequestable,
                                                     responsive: Responsive.Type) async throws -> Responsive.Result {
        let response: Responsive = try await interact(by: request)
        let accessedContent = request.rpcInfo.accessedContent
        if let error = response.error {
            // RPC handle faield
            throw ACRPCProcessErrorKind.rpcHandleFailed.buildError(entity: String(describing: Self.self),
                                                                   msg: "\(accessedContent)->" + "\(error)")
        }
        guard let result = response.result else {
            // Result is nil.
            throw ACRPCProcessErrorKind.nilResult.buildError(entity: String(describing: Self.self),
                                                             msg: "\(accessedContent)")
        }
        return result
    }
    
    /// Requesting detailed data from related RPC services, and automatically building corresponding responses based
    /// on different data formats (e.g., JSON, protoBuf, etc.)
    /// - Parameters:
    ///   - request: The RPC request information used to make a RPC request to interact with Chains.
    ///   - respGenerator: The generator gengerates a correspnding response according to data format.
    /// - Returns: The corresponding result of a RPC response return from chains.
    public func request<Result: Decodable>(_ request: any ACRequestable,
                                           respGenerator: any ACRPCResponsiveGeneratable.Type) async throws -> Result {
        let dataInfo = request.rpcInfo.dataInfo
        // Generating corresponding response according to the data type.
        guard let responsive = respGenerator.generate(by: dataInfo, with: Result.self) else {
            throw ACRPCProcessErrorKind.unsupportedDataType.buildError(entity: String(describing: Self.self),
                                                                       msg: dataInfo.typeName)
        }
        return try await callRPC(by: request, responsive: responsive)
    }
}
