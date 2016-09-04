//
//  PontoCell.swift
//  Pontos
//
//  Created by Alberto Hirota on 9/1/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit

class PontoCell: UITableViewCell {

    @IBOutlet weak var pontoLabel: UILabel!
    @IBOutlet weak var lockedImg: UIImageView!
    var numb: CGFloat = 0

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(pontos: Pontos) {
        pontoLabel.text = pontos.titulo
        lock(pontos.locked)
        
        _ = pontos.tipo
       
    }
    func lock(locked: String) {
        if let n = NSNumberFormatter().numberFromString(locked) {
            numb = CGFloat(n)
            lockedImg.alpha = numb
        }
        
    }
}




    