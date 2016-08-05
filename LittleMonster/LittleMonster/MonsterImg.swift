//
//  MonsterImg.swift
//  LittleMonster
//
//  Created by Alberto Hirota on 8/4/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    override init (frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playidleAnimation()
    }
    func playidleAnimation() {
        
        self.image = UIImage(named: "idle1.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for xg in 1..<5 {
            let img = UIImage(named: "idle\(xg).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDeathAnimation() {
        
        self.image = UIImage(named: "dead5.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for xg in 1..<6 {
            let img = UIImage(named: "dead\(xg).png")
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }

    
}

