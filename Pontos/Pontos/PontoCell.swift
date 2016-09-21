//
//  PontoCell.swift
//  Pontos
//
//  Created by Alberto Hirota on 9/1/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit

class PontoCell: UITableViewCell {

    @IBOutlet weak var pontoTipoLbl: UILabel!
    @IBOutlet weak var pontoLabel: UILabel!
    @IBOutlet weak var lockedImg: UIImageView!
    @IBOutlet weak var favoriteImg: UIImageView!

  
    var numb: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ pontos: Pontos) {
        pontoLabel.text = pontos.titulo
        lock(pontos.locked)
        pontoTipoLbl.text = pontos.tipo
        favoriteTrue(pontos.favorito)
    }
    func lock(_ locked: String) {
        if let n = NumberFormatter().number(from: locked) {
            numb = CGFloat(n)
            lockedImg.alpha = numb
        }
    }
    func favoriteTrue(_ favo: Bool) {
        if favo {
            favoriteImg.alpha = 1
        } else {
            favoriteImg.alpha = 0
        }
    }
}




    
