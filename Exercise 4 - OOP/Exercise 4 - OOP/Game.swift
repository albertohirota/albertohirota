//
//  Game.swift
//  Exercise 4 - OOP
//
//  Created by Alberto Hirota on 8/4/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import Foundation

var firstChoice = 0
var secondChoice = 0
var rightside = ""
var leftside = ""
var first: String = "Soldier"
var second: String = "Orc"
var chooseFirstP: Bool = false
var chooseSecondP: Bool = false

func choosePlayer2() {
    if firstChoice == 2 {
        rightside = first
    } else {
        rightside = second
    }
}

func choosePlayer1() {
    if secondChoice == 2 {
        leftside = first
    } else {
        leftside = second
    }
}

func firstCharacter(first1: Int) {
    selectSnd()
    chooseFirstP = true
    firstChoice = first1
}
func secondCharacter(second1: Int) {
    selectSnd()
    chooseSecondP = true
    secondChoice = second1
}

