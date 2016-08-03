//
//  ViewController.swift
//  Calculator
//
//  Created by Alberto Hirota on 8/1/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit
import AVFoundation

var btnSound: AVAudioPlayer!

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var number: String = ""
    var result: Double = 0
    var operation: Int = 0
    
    @IBOutlet weak var nineBtn: UIButton!
    @IBOutlet weak var eightBtn: UIButton!
    @IBOutlet weak var sevenBtn: UIButton!
    @IBOutlet weak var sixBtn: UIButton!
    @IBOutlet weak var fiveBtn: UIButton!
    @IBOutlet weak var fourBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var divideBtn: UIButton!
    @IBOutlet weak var timesBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var equalBtn: UIButton!
    @IBOutlet weak var screenLbl: UILabel!
    
    @IBAction func pressNineBtn(sender: UIButton) {
    press("9")
    }
    @IBAction func pressEightBtn(sender: UIButton) {
    press("8")
    }
    @IBAction func pressSevenBtn(sender: UIButton) {
    press("7")
    }
    @IBAction func pressSixBtn(sender: UIButton) {
    press("6")
    }
    @IBAction func pressFiveBtn(sender: UIButton) {
    press("5")
    }
    @IBAction func pressFourBtn(sender: UIButton) {
    press("4")
    }
    @IBAction func pressThreeBtn(sender: UIButton) {
    press("3")
    }
    @IBAction func pressTwoBtn(sender: UIButton) {
    press("2")
    }
    @IBAction func pressOneBtn(sender: UIButton) {
    press("1")
    }
    @IBAction func pressZeroBtn(sender: UIButton) {
    press("0")
    }
    @IBAction func pressDivideBtn(sender: UIButton) {
        procedures(4)
    }
    @IBAction func pressTimesBtn(sender: UIButton) {
        procedures(3)
    }
    @IBAction func pressMinusBtn(sender: UIButton) {
        procedures(2)
    }
    @IBAction func pressPlusBtn(sender: UIButton) {
        procedures(1)
    }
    @IBAction func pressEqualBtn(sender: UIButton) {
        btnSound.play()
        calc()
    }
    
    func press(button: String) {
        btnSound.play()
        number = number + button
        screenLbl.text = number
    }
    
    func calc() {
        if number != "" {
            if result == 0 {
                result = Double(number)!
                number = ""
            }
            else {
                if operation==1 {
                    result = result + Double(number)!
                    screenLbl.text = String(result)
                    number = ""
                }
                else if operation == 2 {
                    result = result - Double(number)!
                    screenLbl.text = String(result)
                    number = ""
                }
                else if operation == 3 {
                    result = result * Double(number)!
                    screenLbl.text = String(result)
                    number = ""
                }
                else if operation == 4 {
                    result = result / Double(number)!
                    screenLbl.text = String(result)
                    number = ""
                }
            }
        }
    }
    func opera(ops: Int) {
        if result == 0 {
            operation = ops
        }
    }
    func operad(ops: Int) {
        if result != 0 {
            operation = ops
        }
    }
    func procedures(pro: Int) {
        btnSound.play()
        opera(pro)
        calc()
        operad(pro)
    }
    
    
    
    
    
}

