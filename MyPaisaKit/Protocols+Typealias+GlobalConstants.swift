//
//  Protocols+Typealias+GlobalConstants.swift
//  MyPaisaKit
//
//  Created by Esha Joshi on 11/26/17.
//  Copyright © 2017 Esha Joshi. All rights reserved.
//

import Foundation
import CoreData

// MARK: - Protocols

/// Functions to handle the JSON returned from the network requests to the Google Sheets APIs
public protocol NetworkResponseHandleable {
    
    /**
     Handle Category JSON returned from network request
     
     - parameter categoryJSON: the JSON returned from the network request to create Category entities
     - parameter completion: the escaping closure that takes an error parameter of type 'MyPaisaError'
     
    */
    func handleCategoryJSON(_ categoryJSON: [String : Any], completion: @escaping StorageCompletion)
    
    /**
     Handle Transaction JSON returned from network request
     
     - parameter transactionJSON: the JSON returned from the network request to create Transaction entities
     - parameter completion: the escaping closure that takes an error parameter of type 'MyPaisaError'
     
    */
    func handleTransactionJSON(_ transactionJSON: [String : Any], completion: @escaping StorageCompletion)
}

/// Function to take the array of JSON objects and split them into individual JSON objects that can be converted to core data entities
public protocol JSONConvertable {
    
    /**
     Generic function that converts JSON objects (payload returned from network request) to core data objects
     
     - parameter JSON: the JSON returned from the API call to be parsed and stored in core data as entities
     - parameter asClass: the classname of the entity
     - parameter inContext: the background context that contains the changed core data entities
     
    */
    func convert<T : EntityCreatable>(JSON: [String : Any], asClass class: T.Type, inContext context: NSManagedObjectContext) -> [NSManagedObject]
}

/// Function to create or update Core data entities based on the passed in single JSON object (returned from the network request)
public protocol EntityCreatable {
    
    // ** SOMETHING - I'll figure this out later
}

// MARK: - Typealias

public typealias StorageCompletion = (MyPaisaError?) -> ()

// MARK: - Global Constants

public struct Constants {
    public static let projectName: String = "MyPaisa"
}
