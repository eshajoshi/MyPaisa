//
//  DataController.swift
//  MyPaisa
//
//  Created by Esha Joshi on 11/29/17.
//  Copyright © 2017 Esha Joshi. All rights reserved.
//

import Foundation
import MyPaisaKit

public class DataController: NSObject {
    
    // MARK: - Instance variables
    
    public var coreData: CoreDataController!
    
    // MARK: - Instance functions
    
    override init() {
        super.init()
        
        coreData = CoreDataController()
    }
    
}
