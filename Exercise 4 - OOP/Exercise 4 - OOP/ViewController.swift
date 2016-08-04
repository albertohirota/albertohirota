//
//  ViewController.swift
//  Exercise 4 - OOP
//
//  Created by Alberto Hirota on 8/3/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var playerLeft: Player!
    var playerRight: Player!
    var startedgame: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        start()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var soldierRight: UIImageView!
    @IBOutlet weak var soldierLeft: UIImageView!
    @IBOutlet weak var orcRight: UIImageView!
    @IBOutlet weak var orcLeft: UIImageView!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var leftLbl: UILabel!
    @IBOutlet weak var rightLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var leftHP: UILabel!
    @IBOutlet weak var rightHP: UILabel!
    
    func start() {
        bkMusic()
        statusLbl.text = " Choose First Player"
        leftLbl.text = "Soldier"
        rightLbl.text = "Ogre"
        soldierLeft.hidden = false
        orcRight.hidden = false
        leftLbl.hidden = false
        rightLbl.hidden = false
        playerLeft = Player(startingHP: 100, attackPwr: 35)
        playerRight = Player(startingHP: 80, attackPwr: 50)
        leftHP.text = "\(playerLeft.hp) HP"
        rightHP.text = "\(playerRight.hp) HP"
    }
    
    @IBAction func leftPressed(sender: UIButton) {

        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.holdBtn), userInfo: nil, repeats: false)

        if chooseFirstP == false {
            firstCharacter(1)
            statusLbl.text = "Choose Second Player"
        } else
        if chooseSecondP == false {
            secondCharacter(1)
            prepareToPlay()
            statusLbl.text = "Prepare to Battle"
        } else if startedgame == true && playerLeft.isAlive {
            statusLbl.text = "\(leftside) attacked \(rightside)"
            playerRight.attemptAttack(playerLeft.attackPwr)
            rightHP.text = "\(playerRight.hp) HP"
            attackSnd()
            rightBtn.enabled = false
            leftBtn.enabled = false
        }
        if leftLbl.text == "YES" {
            start()
            soldierRight.hidden = true
            orcRight.hidden = false
            soldierLeft.hidden = false
            orcLeft.hidden = true
            chooseFirstP = false
            chooseSecondP = false
            startedgame = false
    
            firstChoice = 0
            secondChoice = 0
        }
        
        if !playerRight.isAlive {
            dieSnd()
            rightHP.text = ""
            statusLbl.text = "Killed \(rightside) - Would you like play again?"
            soldierRight.hidden = true
            orcRight.hidden = true
            leftLbl.text = "YES"
            rightLbl.text = "NO"
        }
    }
    
    @IBAction func rightPressed(sender: UIButton) {
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.holdBtn), userInfo: nil, repeats: false)
        if chooseFirstP == false {
            firstCharacter(2)
            statusLbl.text = " Choose Second Player"
        } else
        if chooseSecondP == false {
            secondCharacter(2)
            statusLbl.text = "Prepare to Battle"
            prepareToPlay()
        } else if startedgame == true && playerRight.isAlive {
            statusLbl.text = "\(rightside) attacked \(leftside)"
            playerLeft.attemptAttack(playerRight.attackPwr)
            leftHP.text = "\(playerLeft.hp) HP"
            attackSnd()
            rightBtn.enabled = false
            leftBtn.enabled = false
        }
        if !playerLeft.isAlive {
            dieSnd()
            leftHP.text = ""
            statusLbl.text = "Killed \(leftside) - Would you like play again?"
            soldierLeft.hidden = true
            orcLeft.hidden = true
            leftLbl.text = "YES"
            rightLbl.text = "NO"
        }
    }

    func prepareToPlay() {
        soldierLeft.hidden = true
        orcRight.hidden = true
        
        if firstChoice == 1 {
            soldierLeft.hidden = false
        } else {
            orcLeft.hidden = false
        }
        if secondChoice == 1 {
            soldierRight.hidden = false
        } else {
            orcRight.hidden = false
        }
        rightLbl.text = "ATTACK"
        leftLbl.text = "ATTACK"
        leftHP.hidden = false
        rightHP.hidden = false
        startedgame = true
        choosePlayer1()
        choosePlayer2()
    }
    func holdBtn() {
      leftBtn.enabled = true
        rightBtn.enabled = true
    }

}

