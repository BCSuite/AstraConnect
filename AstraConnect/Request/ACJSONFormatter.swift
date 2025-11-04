//
//  ACJSONFormatter.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation

public enum ACJSONFormatter: ACHTTPContentFormattable {
    public static var type: String {
        ACRequestSpace.ACHTTPJSONContentType
    }
}
