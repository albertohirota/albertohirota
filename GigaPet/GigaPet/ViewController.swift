//
//  ViewController.swift
//  GigaPet
//
//  Created by Alberto Hirota on 8/4/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var manImg: AnimationImg!
    @IBOutlet weak var snailImg: AnimationImg!
    @IBOutlet weak var manbg: UIImageView!
    @IBOutlet weak var manGround: UIImageView!
    @IBOutlet weak var snailBg: UIImageView!
    @IBOutlet weak var penalty1: UIImageView!
    @IBOutlet weak var penalty2: UIImageView!
    @IBOutlet weak var penalty3: UIImageView!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var fruitImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var manSelect: UIButton!
    @IBOutlet weak var snailGround: UIImageView!
    @IBOutlet weak var snailSelect: UIButton!
    @IBOutlet weak var selectLbl: UILabel!
    @IBOutlet weak var start1Btn: UIButton!
    @IBOutlet weak var playAgainLbl: UILabel!


    let DIM_ALPHA: CGFloat = 0.2 //
    let OPAQUE: CGFloat = 1.0
    let Max_penalties = 3
    var monsterHappy = true
    var timer: NSTimer!
    var currentItem: UInt32 = 4
    var penalties = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preStart()
        musicSnd()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector (ViewController.itemDroppedOnCharacter), name: "onTargetDropped", object: nil)
        startTimer()
    }
    func itemDroppedOnCharacter(notif: AnyObject) {
        monsterHappy = true
        startTimer()
        foodImg.userInteractionEnabled = false
        heartImg.userInteractionEnabled = false
        fruitImg.userInteractionEnabled = false
        foodImg.alpha = DIM_ALPHA
        heartImg.alpha = DIM_ALPHA
        fruitImg.alpha = DIM_ALPHA
        
       if currentItem == 0 {
            biteSnd()
       } else if currentItem == 1 {
        biteSnd()
       } else if currentItem == 2 {
        heartSnd()
        }
    }
    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
      timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
    func changeGameState() {
        if !monsterHappy {
            penalties = penalties + 1
            skullSnd()
            if penalties == 1 {
                penalty1.alpha = OPAQUE
                penalty2.alpha = DIM_ALPHA
            } else if penalties == 2 {
                penalty2.alpha = OPAQUE
                penalty3.alpha = DIM_ALPHA
            } else if penalties >= 3 {
            penalty3.alpha = OPAQUE
            } else {
                penalty1.alpha = DIM_ALPHA
                penalty2.alpha = DIM_ALPHA
                penalty3.alpha = DIM_ALPHA
            }
            if penalties >= Max_penalties {
                gameOver()
            }
        }
        let rand = arc4random_uniform(3)
        if rand == 0 {
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            fruitImg.alpha = DIM_ALPHA
            fruitImg.userInteractionEnabled = false
        } else if rand == 1 {
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            fruitImg.alpha = OPAQUE
            fruitImg.userInteractionEnabled = true
        } else {
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
            fruitImg.alpha = DIM_ALPHA
            fruitImg.userInteractionEnabled = false
        }
        currentItem = rand
        monsterHappy = false
    }
    func gameOver() {
        timer.invalidate()
        deathSnd()
        playDead()
        start1Btn.hidden = false
        playAgainLbl.hidden = false
    }
    func playDead() {
        if snailImg.hidden == false {
            snailImg.playDeadSnailAnimation()
        } else {
            manImg.playDeathManAnimation()
        }
    }
    @IBAction func snailPressed(sender: UIButton) {
        selectSnd()
        snailBg.hidden = false
        snailGround.hidden = true
        manbg.hidden = true
        manGround.hidden = false
        snailImg.hidden = false
        start()
        snailImg.playSnailAnimation()
        foodImg.dropTarget = snailImg
        heartImg.dropTarget = snailImg
        fruitImg.dropTarget = snailImg
    }
    @IBAction func manPressed(sender: UIButton) {
        manImg.hidden = false
        start()
        selectSnd()
        manImg.playManAnimation()
        foodImg.dropTarget = manImg
        heartImg.dropTarget = manImg
        fruitImg.dropTarget = manImg
    }
    @IBAction func start1Pressed(sender: UIButton) {
        preStart()
        selectSnd()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector (ViewController.itemDroppedOnCharacter), name: "onTargetDropped", object: nil)
        startTimer()
        monsterHappy = true
        currentItem = 4
        penalties = 0
    }
    func start() {
        snailSelect.hidden = true
        manSelect.hidden = true
        selectLbl.hidden = true
        penalty1.hidden = false
        penalty2.hidden = false
        penalty3.hidden = false
        foodImg.hidden = false
        heartImg.hidden = false
        fruitImg.hidden = false
        penalty1.alpha = DIM_ALPHA
        penalty2.alpha = DIM_ALPHA
        penalty3.alpha = DIM_ALPHA
        foodImg.alpha = DIM_ALPHA
        heartImg.alpha = DIM_ALPHA
        fruitImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        heartImg.userInteractionEnabled = false
        fruitImg.userInteractionEnabled = false
    }
    func preStart() {
        snailBg.hidden = true
        snailGround.hidden = false
        manbg.hidden = false
        manGround.hidden = true
        penalty1.hidden = true
        penalty2.hidden = true
        penalty3.hidden = true
        foodImg.hidden = true
        heartImg.hidden = true
        fruitImg.hidden = true
        manImg.hidden = true
        snailImg.hidden = true
        manSelect.hidden = false
        snailSelect.hidden = false
        selectLbl.hidden = false
        start1Btn.hidden = true
        playAgainLbl.hidden = true
    }
}