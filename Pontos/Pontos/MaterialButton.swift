//
//  Button.swift
//  Pontos
//
//  Created by Alberto Hirota on 2016-09-16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit

class MaterialButton: UIButton {
    
    override func awakeFromNib() {
        
        layer.cornerRadius = 5.0
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    }
}
