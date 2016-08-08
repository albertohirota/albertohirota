//
//  Person.swift
//  default-are-fun
//
//  Created by Alberto Hirota on 8/7/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    var firstName: String!
    var lastName: String!
    
    init(first: String, last: String) {
        firstName = first
        lastName = last
    }
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.firstName = aDecoder.decodeObjectForKey("firstName") as? String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as? String
    }
    
    override init() {
    
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey:  "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        
    }
    
}