//
//  ACHTTPContentFormattable.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation

/// Presentatation of  'Content-Type'  for  a HTTP requerst.
public protocol ACHTTPContentFormattable {
    static var type: String { get }
}
