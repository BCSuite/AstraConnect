//
//  RequestWay.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation

/// The way to send a request to chains.
public protocol ACRequestWay {
    
    /// Detail ways, like GET or POST, to send a request
    var detail: String { get }
}


