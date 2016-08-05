//
//  Ogre.swift
//  Exercise 4 - OOP
//
//  Created by Alberto Hirota on 8/3/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import Foundation

class Ogre: Player {
    var Name: String = "Enemy"
    let maxSuffer = 15
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr <= maxSuffer {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    
    
        
        
    }
}
