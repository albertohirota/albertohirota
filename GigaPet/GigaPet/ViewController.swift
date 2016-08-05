//
//  ViewController.swift
//  GigaPet
//
//  Created by Alberto Hirota on 8/4/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var manbg: UIImageView!
    @IBOutlet weak var manGround: UIImageView!
    @IBOutlet weak var snailBg: UIImageView!
    @IBOutlet weak var snailGround: UIImageView!
    @IBOutlet weak var penalty1: UIImageView!
    @IBOutlet weak var penalty2: UIImageView!
    @IBOutlet weak var penalty3: UIImageView!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var fruitImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var manImg: UIImageView!
    @IBOutlet weak var snailImg: UIImageView!
    @IBOutlet weak var manSelect: UIButton!
    @IBOutlet weak var snailSelect: UIButton!
    @IBOutlet weak var selectLbl: UILabel!
    @IBOutlet weak var startBtn: UIButton!

    let DIM_ALPHA: CGFloat = 0.2 //
    let OPAQUE: CGFloat = 1.0
    var selectedCharacter = ""
    var selectedCharacterA = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        musicSnd()
    
    }

   
    
    @IBAction func snailPressed(sender: UIButton) {
        selectSnd()
        snailBg.hidden = false
        snailGround.hidden = false
        manbg.hidden = true
        manGround.hidden = true
        snailImg.hidden = false
        start()
        selectChar(2)
    }
    @IBAction func manPressed(sender: UIButton) {
        manImg.hidden = false
        start()
        selectSnd()
        selectChar(1)
    }
    @IBAction func startPressed(sender: UIButton) {
        preStart()
        selectSnd()
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
    }
    func preStart() {
        snailBg.hidden = true
        snailGround.hidden = true
        manbg.hidden = false
        manGround.hidden = false
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
        startBtn.hidden = true
        
    }
    func selectChar (select: Int) {
        if select == 1 {
            selectedCharacter = "idle1"
            selectedCharacterA = "idle"
        } else {
            selectedCharacter = "blue_idle1"
            selectedCharacterA = "blue_idle"
        }
    }
}
