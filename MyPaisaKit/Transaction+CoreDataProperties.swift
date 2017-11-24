//
//  Transaction+CoreDataProperties.swift
//  MyPaisaKit
//
//  Created by Esha Joshi on 11/23/17.
//  Copyright © 2017 Esha Joshi. All rights reserved.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var supplier: String?
    @NSManaged public var location: String?
    @NSManaged public var amount: NSDecimalNumber?
    @NSManaged public var isIncome: Bool
    @NSManaged public var type: String?
    @NSManaged public var id: String?
    @NSManaged public var category: Category?

}
