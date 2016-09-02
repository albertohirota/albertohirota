//
//  Pontos.swift
//  Pontos
//
//  Created by Alberto Hirota on 8/30/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit
import Foundation

struct Pontos {
    var id = " "
    var tipo = " "
    var locked = " "
    var titulo = " "
    var autor = " "
    var linha1 = " "
    var linha2 = " "
    var linha3 = " "
    var linha4 = " "
    var linha5 = " "
    var linha6 = " "
    var linha7 = " "
    var linha8 = " "
    var linha9 = " "
    var linha10 = " "
    var linha11 = " "
    var linha12 = " "
    var linha13 = " "
    var linha14 = " "
    var linha15 = " "
    var linha16 = " "
    var linha17 = " "
    var linha18 = " "
    var linha19 = " "
    var linha20 = " "
    var linha21 = " "
    var linha22 = " "
    var linha23 = " "
    var linha24 = " "
    var linha25 = " "
    
    static func createPontos() -> [Pontos] {
       
        var dictPonto = [Pontos]()
        
        if let path = NSBundle.mainBundle().pathForResource("pontos", ofType: "json") {
            do {
                let jsonData = NSData(contentsOfFile: path)
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.AllowFragments)
                    if let dictPont = jsonResult as? Dictionary<String, AnyObject> {
                        if let dataroot = dictPont["dataroot"] {
                            if let listP = dataroot["Ponto"] as? [Dictionary<String, AnyObject>] {
                                var index = 0
                                var id = " "
                                var tipo = " "
                                var locked = " "
                                var titulo = " "
                                var autor = " "
                                var linha1 = " "
                                var linha2 = " "
                                var linha3 = " "
                                var linha4 = " "
                                var linha5 = " "
                                var linha6 = " "
                                var linha7 = " "
                                var linha8 = " "
                                var linha9 = " "
                                var linha10 = " "
                                var linha11 = " "
                                var linha12 = " "
                                var linha13 = " "
                                var linha14 = " "
                                var linha15 = " "
                                var linha16 = " "
                                var linha17 = " "
                                var linha18 = " "
                                var linha19 = " "
                                var linha20 = " "
                                var linha21 = " "
                                var linha22 = " "
                                var linha23 = " "
                                var linha24 = " "
                                var linha25 = " "
                                
                                while index != 22 {
                                    if let id1 = listP[index]["ID"] as? String {
                                        id = id1
                                    }
                                    if let tipo1 = listP[index]["Tipo"] as? String {
                                        tipo = tipo1
                                    }
                                    if let locked1 = listP[index]["Locked"] as? String {
                                        locked = locked1
                                    }
                                    if let titulo1 = listP[index]["Titulo"] as? String {
                                        titulo = titulo1
                                    }
                                    if let autor1 = listP[index]["Autor"] as? String {
                                        autor = autor1
                                    }
                                    if let linha1a = listP[index]["_x0031_"] as? String {
                                        linha1 = linha1a
                                    }
                                    if let linha2a = listP[index]["_x0032_"] as? String {
                                        linha2 = linha2a
                                    }
                                    if let linha3a = listP[index]["_x0033_"] as? String {
                                        linha3 = linha3a
                                    }
                                    if let linha4a = listP[index]["_x0034_"] as? String {
                                        linha4 = linha4a
                                    }
                                    if let linha5a = listP[index]["_x0035_"] as? String {
                                        linha5 = linha5a
                                    }
                                    if let linha6a = listP[index]["_x0036_"] as? String {
                                        linha6 = linha6a
                                    }
                                    if let linha7a = listP[index]["_x0037_"] as? String {
                                        linha7 = linha7a
                                    }
                                    if let linha8a = listP[index]["_x0038_"] as? String {
                                        linha8 = linha8a
                                    }
                                    if let linha9a = listP[index]["_x0039_"] as? String {
                                        linha9 = linha9a
                                    }
                                    if let linha10a = listP[index]["_x0031_0"] as? String {
                                        linha10 = linha10a
                                    }
                                    if let linha11a = listP[index]["_x0031_1"] as? String {
                                        linha11 = linha11a
                                    }
                                    if let linha12a = listP[index]["_x0032_2"] as? String {
                                        linha12 = linha12a
                                    }
                                    if let linha13a = listP[index]["_x0033_3"] as? String {
                                        linha13 = linha13a
                                    }
                                    if let linha14a = listP[index]["_x0034_4"] as? String {
                                        linha14 = linha14a
                                    }
                                    if let linha15a = listP[index]["_x0035_5"] as? String {
                                        linha15 = linha15a
                                    }
                                    if let linha16a = listP[index]["_x0036_6"] as? String {
                                        linha16 = linha16a
                                    }
                                    if let linha17a = listP[index]["_x0037_7"] as? String {
                                        linha17 = linha17a
                                    }
                                    if let linha18a = listP[index]["_x0038_8"] as? String {
                                        linha18 = linha18a
                                    }
                                    if let linha19a = listP[index]["_x0039_9"] as? String {
                                        linha19 = linha19a
                                    }
                                    if let linha20a = listP[index]["_x0032_0"] as? String {
                                        linha20 = linha20a
                                    }
                                    if let linha21a = listP[index]["_x0032_1"] as? String {
                                        linha21 = linha21a
                                    }
                                    if let linha22a = listP[index]["_x0032_2"] as? String {
                                        linha22 = linha22a
                                    }
                                    if let linha23a = listP[index]["_x0032_3"] as? String {
                                        linha23 = linha23a
                                    }
                                    if let linha24a = listP[index]["_x0032_4"] as? String {
                                        linha24 = linha24a
                                    }
                                    if let linha25a = listP[index]["_x0032_5"] as? String {
                                        linha25 = linha25a
                                    }
                                    
                                    let dictP = Pontos(id: id, tipo: tipo, locked: locked, titulo: titulo, autor: autor, linha1: linha1, linha2: linha2, linha3: linha3, linha4: linha4, linha5: linha5, linha6: linha6, linha7: linha7, linha8: linha8, linha9: linha9, linha10: linha10, linha11: linha11, linha12: linha12, linha13: linha13, linha14: linha14, linha15: linha15, linha16: linha16, linha17: linha17, linha18: linha18, linha19: linha19, linha20: linha20, linha21: linha21, linha22: linha22, linha23: linha23, linha24: linha24, linha25: linha25)
                                    dictPonto.append(dictP)
                                    
                                    index = index + 1
                                }
                            }
                        }
                    }
                }
            } catch {
                print("Could not serialize")
            }
        }
        return dictPonto
    }
}