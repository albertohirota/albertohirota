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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //var webView: WKWebView!
    //@IBOutlet weak var movieImg: UIImageView!
    //@IBOutlet weak var movieTitle: UILabel!
    //@IBOutlet weak var movieDescription: UILabel!
    //@IBOutlet weak var movieUrl: UILabel!
    //override func awakeFromNib() {
    //    super.awakeFromNib()
        // Initialization code
    //}
    
    func configureCell(pontos: Pontos) {
        pontoLabel.text = pontos.titulo
        
    }

    
}




    