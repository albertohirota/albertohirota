//
//  AboutVC.swift
//  Pontos
//
//  Created by Alberto Hirota on 05/09/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    @IBOutlet weak var restoreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restoreButton.layer.cornerRadius = 5.0
        restoreButton.layer.shadowOpacity = 0.8
        restoreButton.layer.shadowRadius = 5.0
        restoreButton.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        // Do any additional setup after loading the view.
    }

    
    @IBAction func restoreBtn(sender: AnyObject) {
    }
    
    
    
}
