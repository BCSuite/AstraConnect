//
//  ACRPCJSONData.swift
//  AstraConnect
//
//  Created by scott on 2025/10/21.
//

import Foundation

/// JSON Data representation.
public enum ACRPCJSONData: ACRPCDataRepresentable {
    private static let TypeName = "json"
    public static var typeName: String {
        Self.TypeName
    }
}


