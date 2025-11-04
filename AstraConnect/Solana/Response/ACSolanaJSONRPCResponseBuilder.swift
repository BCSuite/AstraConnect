//
//  ACSolanaJSONRPCResponseBuilder.swift
//  AstraConnect
//
//  Created by scott on 2025/11/3.
//

import Foundation

/// The builder mainly build a ACSolanaJSONRPCResponse.self.
public enum ACSolanaJSONRPCResponseBuilder: ACRPCResponseBuildable {
    public static func build<Result: Decodable>(with result: Result.Type) -> any ACRPCResponsive<Result>.Type {
        ACSolanaJSONRPCResponse<Result>.self
    }
}
