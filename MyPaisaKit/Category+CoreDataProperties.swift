//
//  Category+CoreDataProperties.swift
//  MyPaisaKit
//
//  Created by Esha Joshi on 11/23/17.
//  Copyright © 2017 Esha Joshi. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var totalExpenses: NSDecimalNumber?
    @NSManaged public var month: String?
    @NSManaged public var monthlyBudget: NSDecimalNumber?
    @NSManaged public var amountRemaining: NSDecimalNumber?
    @NSManaged public var itemsArray: [String]?
    @NSManaged public var allTransactions: NSSet?

}

// MARK: Generated accessors for allTransactions
extension Category {

    @objc(addAllTransactionsObject:)
    @NSManaged public func addToAllTransactions(_ value: Transaction)

    @objc(removeAllTransactionsObject:)
    @NSManaged public func removeFromAllTransactions(_ value: Transaction)

    @objc(addAllTransactions:)
    @NSManaged public func addToAllTransactions(_ values: NSSet)

    @objc(removeAllTransactions:)
    @NSManaged public func removeFromAllTransactions(_ values: NSSet)

}
