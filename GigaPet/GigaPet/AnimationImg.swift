//
//  AnimationImg.swift
//  GigaPet
//
//  Created by Alberto Hirota on 8/5/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit

class AnimationImg: UIImageView  {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    func playManAnimation() {
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil
        
        var imgArray1 = [UIImage]()
        for x in 1..<5 {
            let img1 = UIImage(named: "idle\(x).png")
            imgArray1.append(img1!)
        }
        self.animationImages = imgArray1
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    func playSnailAnimation() {
        self.image = UIImage(named: "blue_idle1.png")
        self.animationImages = nil
        var imgArray2 = [UIImage]()
        for y in 1..<5 {
            let img2 = UIImage(named: "blue_idle\(y).png")
            imgArray2.append(img2!)
        }
        self.animationImages = imgArray2
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    func playDeathManAnimation() {
        self.image = UIImage(named: "dead5.png")
        self.animationImages = nil
        
        var imgArray3 = [UIImage]()
        for z in 1..<6 {
            let img3 = UIImage(named: "dead\(z).png")
            imgArray3.append(img3!)
        }
        self.animationImages = imgArray3
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    func playDeadSnailAnimation() {
        self.image = UIImage(named: "blue_dead3.png")
        self.animationImages = nil
        
        var imgArray4 = [UIImage]()
        for a in 1..<4 {
            let img4 = UIImage(named: "blue_dead\(a).png")
            imgArray4.append(img4!)
        }
        self.animationImages = imgArray4
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }
}
