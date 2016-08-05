//
//  ViewController.swift
//  LittleMonster
//
//  Created by Alberto Hirota on 8/4/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var timer: NSTimer!
    var monsterHappy = false
    var currentItem: UInt32 = 0
    
    var musicPlayer: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter), name: "onTargetDropped", object: nil)
        
        startTimer()
        
    foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
        penaltyOne.alpha = DIM_ALPHA //command to make image not OPAQUE
        penaltyTwo.alpha = DIM_ALPHA
        penaltyThree.alpha = DIM_ALPHA
        
        do {
            
            try musicPlayer = AVAudioPlayer(contentsOfURL: NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))
            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            try sfxDeath = AVAudioPlayer(contentsOfURL: NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            
            musicPlayer.prepareToPlay()
            musicPlayer.play()
            
            sfxBite.prepareToPlay()
            sfxDeath.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxSkull.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        
        
        
    }

    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var penaltyOne: UIImageView!
    @IBOutlet weak var penaltyTwo: UIImageView!
    @IBOutlet weak var penaltyThree: UIImageView!

    func itemDroppedOnCharacter(notif: AnyObject) {
        monsterHappy = true
        startTimer()
        
        foodImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        heartImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
        
        if currentItem == 0 {
            sfxHeart.play()
        } else {
            sfxBite.play()
        }
    }
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0
    
    
    
    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
            timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
    

    
    
    func changeGameState() {
        
        if !monsterHappy {
            penalties = penalties + 1
            sfxSkull.play()
            
            if penalties == 1 {
                penaltyOne.alpha = OPAQUE
                penaltyTwo.alpha = DIM_ALPHA
                
            } else if penalties == 2 {
                penaltyTwo.alpha = OPAQUE
                penaltyThree.alpha = DIM_ALPHA
            } else if penalties >= 3 {
                penaltyThree.alpha = OPAQUE
            } else {
                penaltyOne.alpha = DIM_ALPHA
                penaltyTwo.alpha = DIM_ALPHA
                penaltyThree.alpha = DIM_ALPHA
            }
            
            if penalties >= MAX_PENALTIES {
                gameOver()
            }

        }
        
        let rand = arc4random_uniform(2) // 0 or 1
        
        if rand == 0 {
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
        } else {
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
        }
        currentItem = rand
        monsterHappy = false
    }
    func gameOver() {
        timer.invalidate()
        monsterImg.playDeathAnimation()
        sfxDeath.play()
    }

}

