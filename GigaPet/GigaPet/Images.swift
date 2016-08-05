//
//  Images.swift
//  GigaPet
//
//  Created by Alberto Hirota on 8/5/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
        
    }
    func playIdleAnimation() {
        self.image = UIImage(named: teste)
    }
    
    
    var teste = "srefff"
   self.selectedCharacter = selectchars
    
    ViewController.selectedCharacter
    
    
}






