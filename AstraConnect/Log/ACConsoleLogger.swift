//
//  ACConsoleLogger.swift
//  AstraConnect
//
//  Created by scott on 2025/10/22.
//

import Foundation
 
/// Default logger which internally uses console to output.
public struct ACConsoleLogger: ACLoggable {
    public init() {}
    
    public func log(_ output: String) {
        print(output)
    }
}
