//
//  ACLoggable.swift
//  AstraConnect
//
//  Created by scott on 2025/10/22.
//

import Foundation


/// A log protocol that output related informations,  output to the conslog by default.
public protocol ACLoggable {
    func log(_ output: String)
}
