//
//  DragImg.swift
//  GigaPet
//
//  Created by Alberto Hirota on 8/5/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import Foundation
import UIKit

class DragImg: UIImageView {
    var originalPosition: CGPoint!
    var dropTarget: UIView?
   // var onTargetDropped = 0
    
    override init(frame: CGRect) { //overriding frame image movement
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
     if let touch = touches.first, let target = dropTarget {
        let position = touch.locationInView(self.superview)
        if CGRectContainsPoint(target.frame, position) {
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onTargetDropped", object: nil))
        }
     }
        self.center = originalPosition
    }
    
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "NomeDaSegue" {
//            let svc = segue.destinationViewController as! ViewController
//            
//            svc.targetOn = onTargetDropped
//            svc.gameOver()
//        }
//    }
//
    
}



