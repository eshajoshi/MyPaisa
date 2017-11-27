//
//  Protocols+Typealias+GlobalConstants.swift
//  MyPaisaKit
//
//  Created by Esha Joshi on 11/26/17.
//  Copyright © 2017 Esha Joshi. All rights reserved.
//

import Foundation

// MARK: - Protocols

///**
// Handle Reason JSON returned from network requests
//
// - parameter reasonJSON: the JSON returned from the network request to retrieve reason entities
// - parameter completion: closure that takes an error parameter of type **CommitmentsError**
//
// */
//func handleReasonJSON(_ reasonJSON: [[String : Any]], completion: @escaping StorageCompletion)

/// Functions to handle the JSON returned from the network requests to the Google Sheets APIs
public protocol NetworkResponseHandleable {
    
    /**
    */
    func handleCategoryJSON()
    
    /**
    */
    func handleTransactionJSON(_ transactionJSON: [String: Any], completion: @escaping StorageCompletion)
}

// MARK: - Typealias

public typealias StorageCompletion = (MyPaisaError?) -> ()

// MARK: - Global Constants

public struct Constants {
    public static let projectName: String = "MyPaisa"
}
