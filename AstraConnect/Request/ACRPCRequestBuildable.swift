//
//  ACRPCPayloadBuildable.swift
//  AstraConnect
//
//  Created by scott on 2025/11/3.
//

import Foundation


/// A protocol mainly used to build a ACRequestable according to detailed params.
public protocol ACRPCRequestBuildable {
    
    /// Build a ACRequestable according to detailed params.
    /// - Parameters:
    ///   - methodName: The detailed RPC method name.
    ///   - rpcAddress: Corresponding RPC service remote address.
    ///   - singleValueParams: The params list made up of the single value which contains only value not key, for example: {"params": [singleValue1, singleValue2, {"key1": "value1" }]},  singleValue1 and  singleValue2 are single values without key and placed in a array directly.
    ///
    ///   - listParams: The corresponding optional params placed in a array, every item must be a ACDynamicCodation and its wrappedValue
    ///   must be an array, otherwise leading to invalid request params.
    ///   
    ///   - pairedParams: The corresponding optional params paired with key-value like {"key1": "value1" }.
    /// - Returns: Any ACRequestable which represent RPC informations used for a RPC call.
    static func buildRequest(methodName: String,
                             rpcAddress: String,
                             singleValueParams: [any Encodable]?,
                             listParams: [ACDynamicCodation]?,
                             pairedParams: [any Encodable]?) -> any ACRequestable
}
