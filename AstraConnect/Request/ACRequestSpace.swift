//
//  ACRequest.swift
//  AstraConnect
//
//  Created by scott on 2025/10/20.
//

import Foundation

/// A namespace for all requests related shared informations.
public enum ACRequestSpace {
    
    /// Field name of "Content-Type" in HTTP header
    static let ACHTTPCTField = "Content-Type"
    
    /// Description when the "Content-Type"  is JSON.
    static let ACHTTPJSONContentType = "application/json"
    
    /// Status code for a success HTTP request.
    static let ACHTTPReuqestSuccessCode = 200

}
