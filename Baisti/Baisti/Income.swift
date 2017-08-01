//
//  Income.swift
//  Baisti
//
//  Created by Mahmood al-Zadjali on 01/08/2017.
//  Copyright © 2017 Mahmood al-Zadjali. All rights reserved.
//

import Foundation

class Income: NSObject, NSCoding {
    // MARK: Properties
    var name: String
    var value: String
    
    // MARK: Archiving Paths
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Baisti")
    
    //MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let value = "value"
    }
    
    
    //MARK: Initialisation
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(value, forKey: PropertyKey.value)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {return nil}
        let value = aDecoder.decodeObject(forKey: PropertyKey.value) as? String
        
        self.init(name: name, value: value!)
    }
}
