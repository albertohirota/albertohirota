//
//  DetailPontosVC.swift
//  Pontos
//
//  Created by Alberto Hirota on 2016-09-04.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit

class DetailPontosVC: UIViewController {
    
    var pontos = Pontos()
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var autorLbl: UILabel!
    @IBOutlet weak var oneLbl: UILabel!
    @IBOutlet weak var twoLbl: UILabel!
    @IBOutlet weak var threeLbl: UILabel!
    @IBOutlet weak var fourLbl: UILabel!
    @IBOutlet weak var fiveLbl: UILabel!
    @IBOutlet weak var sixLbl: UILabel!
    @IBOutlet weak var sevenLbl: UILabel!
    @IBOutlet weak var eightLbl: UILabel!
    @IBOutlet weak var nineLbl: UILabel!
    @IBOutlet weak var tenLbl: UILabel!
    @IBOutlet weak var elevenLbl: UILabel!
    @IBOutlet weak var twelveLbl: UILabel!
    @IBOutlet weak var thirteenLbl: UILabel!
    @IBOutlet weak var fourteenLbl: UILabel!
    @IBOutlet weak var fifteenLbl: UILabel!
    @IBOutlet weak var sixteenLbl: UILabel!
    @IBOutlet weak var seventeenLbl: UILabel!
    @IBOutlet weak var eightteenLbl: UILabel!
    @IBOutlet weak var nineteenLbl: UILabel!
    @IBOutlet weak var twentyLbl: UILabel!
    @IBOutlet weak var twentyoneLbl: UILabel!
    @IBOutlet weak var twentytwoLbl: UILabel!
    @IBOutlet weak var twentythreeLbl: UILabel!
    @IBOutlet weak var twentyfourLbl: UILabel!
    @IBOutlet weak var twentyfiveLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updatePonto()

        // Do any additional setup after loading the view.
    }
    func updatePonto() {
        tituloLbl.text = pontos.titulo
        autorLbl.text = pontos.autor
        oneLbl.text = pontos.linha1
        twoLbl.text = pontos.linha2
        threeLbl.text = pontos.linha3
        fourLbl.text = pontos.linha4
        fiveLbl.text = pontos.linha5
        sixLbl.text = pontos.linha6
        sevenLbl.text = pontos.linha7
        eightLbl.text = pontos.linha8
        nineLbl.text = pontos.linha9
        tenLbl.text = pontos.linha10
        elevenLbl.text = pontos.linha11
        twelveLbl.text = pontos.linha12
        thirteenLbl.text = pontos.linha13
        fourteenLbl.text = pontos.linha14
        fifteenLbl.text = pontos.linha15
        sixteenLbl.text = pontos.linha16
        seventeenLbl.text = pontos.linha17
        eightteenLbl.text = pontos.linha18
        nineteenLbl.text = pontos.linha19
        twentyLbl.text = pontos.linha20
        twentyoneLbl.text = pontos.linha21
        twentytwoLbl.text = pontos.linha22
        twentythreeLbl.text = pontos.linha23
        twentyfourLbl.text = pontos.linha24
        twentyfiveLbl.text = pontos.linha25
    }
   
    
}
