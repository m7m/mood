//
//  Expenses.swift
//  Baisti
//
//  Created by Mahmood al-Zadjali on 30/07/2017.
//  Copyright © 2017 Mahmood al-Zadjali. All rights reserved.
//

import Foundation
import UIKit

class Expenses: NSObject, NSCoding {
    
    //MARK: Properties
    var expenseName: String
    var expenseValue: Double
    
    //MARK: Archiving Paths
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Baisti")
    
    //MARK: Types
    struct PropertyKey {
        static let expenseName = "expenseName"
        static let expenseValue = "expenseValue"
    }
    
    //MARK: Initialisation
    init(expenseName: String, expenseValue: Double) {
        self.expenseName = expenseName
        self.expenseValue = expenseValue
    }
    
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(expenseName, forKey: PropertyKey.expenseName)
        aCoder.encode(expenseValue, forKey: PropertyKey.expenseValue)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let expenseName = aDecoder.decodeObject(forKey: PropertyKey.expenseName) as? String else { return nil }
        let expenseValue = aDecoder.decodeObject(forKey: PropertyKey.expenseValue) as? Double
        
        self.init(expenseName: expenseName, expenseValue: expenseValue!)
    }
}
