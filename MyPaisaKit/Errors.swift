//
//  Errors.swift
//  MyPaisaKit
//
//  Created by Esha Joshi on 11/25/17.
//  Copyright © 2017 Esha Joshi. All rights reserved.
//

import Foundation

public enum MyPaisaError: Error {
    case unableToCreatePersistentStore(Error)
    
    public var description: String {
        var aDescription: String
        
        switch self {
        case .unableToCreatePersistentStore(let error):
            aDescription = "Unable to create core data persistent store \(error.localizedDescription)"
        }
        
        return aDescription
    }
}
