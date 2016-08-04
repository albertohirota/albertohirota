//
//  Character.swift
//  Exercise 4 - OOP
//
//  Created by Alberto Hirota on 8/3/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import Foundation


class Player {
    private var _hp: Int = 100
    private var _attackPwr: Int = 10

    var hp: Int {
        get {
            return _hp
        }
    }
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    init (startingHP: Int, attackPwr: Int) {
        self._hp = startingHP
        self._attackPwr = attackPwr
    }
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    func attemptAttack (attackPwr: Int) -> Bool {
        let rand = Int(arc4random_uniform(UInt32(attackPwr)))
        
        self._hp -= rand
        return true
    }
 }
