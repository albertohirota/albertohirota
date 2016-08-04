//
//  Sound.swift
//  Exercise 4 - OOP
//
//  Created by Alberto Hirota on 8/4/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import Foundation
import AVFoundation

var music: AVAudioPlayer!
var musicb: AVAudioPlayer!

func bkMusic() {
    soundback("Saint Seiya - Japanese - Pegasus RyuSeiKen", ext: "mp3")
}
func attackSnd() {
    sound("215033__taira-komori__katana1", ext: "mp3")
}
func dieSnd() {
    sound("76969__michel88__paino", ext: "wav")
}
func selectSnd() {
    sound("271139__strange-dragoon__menu-select", ext: "wav")
}



func sound(name: String, ext: String) {
    let path = NSBundle.mainBundle().pathForResource(name, ofType: ext)
    let soundURL = NSURL(fileURLWithPath: path!)
    
    do {
        try music = AVAudioPlayer(contentsOfURL: soundURL)
        music.prepareToPlay()
    } catch let err as NSError {
        print(err.debugDescription)
    }
    music.play()
}

func soundback(name: String, ext: String) {
    let path = NSBundle.mainBundle().pathForResource(name, ofType: ext)
    let soundURL = NSURL(fileURLWithPath: path!)
    
    do {
        try musicb = AVAudioPlayer(contentsOfURL: soundURL)
        musicb.prepareToPlay()
    } catch let err as NSError {
        print(err.debugDescription)
    }
    musicb.play()
}