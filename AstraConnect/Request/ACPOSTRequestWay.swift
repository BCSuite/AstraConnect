//
//  POSTRequestWay.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation


/// Using 'POST' to send a request.
public struct ACPOSTRequestWay: ACRequestWay {
    public static let POSTMethodDesc = "POST"
    public var detail: String {
        ACPOSTRequestWay.POSTMethodDesc
    }
    
    public init() {}
}
