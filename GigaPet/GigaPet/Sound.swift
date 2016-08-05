//
//  game.swift
//  GigaPet
//
//  Created by Alberto Hirota on 8/5/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import AVFoundation

var musicPlay: AVAudioPlayer!
var sound: AVAudioPlayer!

func selectSnd() {
    sound("select", ext: "wav")
}
func musicSnd() {
    musicPlay("cave-music", ext: "mp3")
}
func biteSnd() {
    sound("bite", ext: "wav")
}
func deathSnd() {
    sound("death", ext: "wav")
}
func skullSnd() {
    sound("skull", ext: "wav")
}
func heartSnd() {
    sound("heart", ext: "wav")
}

func sound(name: String, ext: String) {
    let path = NSBundle.mainBundle().pathForResource(name, ofType: ext)
    let soundURL = NSURL(fileURLWithPath: path!)
    
    do {
        try sound = AVAudioPlayer(contentsOfURL: soundURL)
        sound.prepareToPlay()
    } catch let err as NSError {
        print(err.debugDescription)
    }
    sound.play()
}
func musicPlay(name: String, ext: String) {
    let path = NSBundle.mainBundle().pathForResource(name, ofType: ext)
    let soundURL = NSURL(fileURLWithPath: path!)
    
    do {
        try musicPlay = AVAudioPlayer(contentsOfURL: soundURL)
        musicPlay.prepareToPlay()
    } catch let err as NSError {
        print(err.debugDescription)
    }
    musicPlay.play()
}