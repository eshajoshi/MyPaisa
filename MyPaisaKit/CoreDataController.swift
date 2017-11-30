//
//  CoreDataController.swift
//  MyPaisaKit
//
//  Created by Esha Joshi on 11/24/17.
//  Copyright © 2017 Esha Joshi. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataController {
    
    // MARK: - Instance variables
    
    lazy private var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. Managed object model is a programmic representation of the object model created / maintained in the model editor of Xcode. "momd" is the compiled versoin of the 'xcdatamodeld' file
        let modelURL = Bundle(for: CoreDataController.self).url(forResource: Constants.projectName, withExtension: "momd")!
        
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()

    lazy var persistentStoreContainer: NSPersistentContainer = {
        // The persistent store coordinator for the application. Creates and returns a store coordinator, associating the persistent stores with the model (for storage persistence and model information retrieval).
        let container = NSPersistentContainer(name: Constants.projectName, managedObjectModel: self.managedObjectModel)
        
        // The container's context maintains changes to managed objects, until the context is saved to a persistent store. Through a context you can "fetch" objects. Merge policy merges conflicts between the persistent store's version of the object and current in-memory version by individual property, with the in-memory changes trumping external changes.
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergePolicy(merge: NSMergePolicyType.mergeByPropertyStoreTrumpMergePolicyType)
        
        // Instructs the persistent container to load the persistent stores. Once the completion handler has fired, the stack is fully initialized (the completion handler will be called once for each store that is created)
        container.loadPersistentStores() { storeDescription, error in
            if let error = error {
                do {
                    try container.persistentStoreCoordinator.destroyPersistentStore(at: storeDescription.url!, ofType: NSSQLiteStoreType, options: nil)
                    container.loadPersistentStores() { storeDescription, error in
                        if let error = error {
                            let myPaisaError = MyPaisaError.unableToCreatePersistentStore(error)
                            print(myPaisaError.description)
                        }
                    }
                } catch {
                    let myPaisaError = MyPaisaError.unableToCreatePersistentStore(error)
                    print(myPaisaError.description)
                }
            }
        }
        
        return container
    }()
    
    // MARK: - Instance functions
    
    public init() {
        print("In CoreDataController")
    }
    
    /**
     Save the changes of the passed in managed object context. If there is an error in saving the changes, all managed objects will be restored to their last committed values.
     
     - parameter context: Specific context that changes to core data will be saved to
     
    */
    public func save(_ context: NSManagedObjectContext? = nil) {
        let context = context ?? persistentStoreContainer.viewContext
        
        if context.hasChanges {
            do {
               try context.save()
            } catch {
                context.rollback()
                
                let myPaisaError = MyPaisaError.unableToSaveToCoreDataContext(error)
                print(myPaisaError.description)
            }
        }
    }
    
}
