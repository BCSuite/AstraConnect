//
//  ACHTTPContentFormatterFactory.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// The default factory generate a HTTP 'Content-type' Formatter  according to data.
public enum ACHTTPContentFormatterFactory: ACHTTPContentFormatterGeneratable {
    
    /// A map represents related ACHTTPContentFormattable for different data type.
    public static let formatterMap = [ACRPCJSONData.typeName: ACJSONFormatter.self]
    public static func generateFormatter(by dataInfo: any ACRPCDataRepresentable.Type) -> (any ACHTTPContentFormattable.Type)? {
        formatterMap[dataInfo.typeName]
    }
}
