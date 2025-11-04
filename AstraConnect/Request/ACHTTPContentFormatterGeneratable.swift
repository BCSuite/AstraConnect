//
//  ACHTTPContentFormatterGeneratable.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// A factory protocol to generate any ACHTTPContentFormattable.
public protocol ACHTTPContentFormatterGeneratable {
    
    /// Generate any ACHTTPContentFormattable according to ACRPCDataRepresentable.
    /// - Parameter dataInfo: Data informations.
    /// - Returns: any ACRPCDataRepresentable, nil if  the data is not supported.
    static func generateFormatter(by dataInfo: ACRPCDataRepresentable.Type) -> (any ACHTTPContentFormattable.Type)?
}
