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
    @IBOutlet weak var foodImg: UIImageView!
    @IBOutlet weak var fruitImg: UIImageView!
    @IBOutlet weak var heartImg: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    
    func preStart() {
        snailBg.hidden = true
        snailGround.hidden = true
        manbg.hidden = false
        manGround.hidden = false
        penalty1.hidden = false
        penalty2.hidden = false
        penalty3.hidden = false
    }
    
    
}

