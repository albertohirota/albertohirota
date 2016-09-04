//
//  PontosVC.swift
//  Pontos
//
//  Created by Alberto Hirota on 8/31/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit

class PontosVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pontosPicker: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    var pontos = Pontos.createPontos()
    var selectTipo: [String] = [String]()
    var inPickerMode = false
    static var locked = true
    var selectTipo1: [String] = [String]()
    var pickerSelected: String?
    var filteredPicker = Pontos.createPontos()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appPaid()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.pontosPicker.delegate = self
        self.pontosPicker.dataSource = self
        selectType()
        
        
        
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return selectTipo.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectTipo[row]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inPickerMode {
            return self.filteredPicker.count
        } else {
            return self.pontos.count
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("PontoCell", forIndexPath: indexPath) as? PontoCell {
            if inPickerMode {
                let ponto = self.filteredPicker[indexPath.row]
                cell.configureCell(ponto)
                return cell
            } else {
                let ponto = self.pontos[indexPath.row]
                cell.configureCell(ponto)
                return cell
            }
            
        } else {
            return PontoCell()
        }
    }
    func appPaid() {
        PontosVC.locked = true
        
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerSelected = selectTipo[row]
        if pickerSelected == "Todos" {
            inPickerMode = false
            tableView.reloadData()
        } else {
            inPickerMode = true
            filteredPicker = pontos.filter({$0.tipo == pickerSelected})
            tableView.reloadData()
        }
    }
    func selectType() {
        if let path = NSBundle.mainBundle().pathForResource("pontos", ofType: "json") {
            do {
                let jsonData = NSData(contentsOfFile: path)
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.AllowFragments)
                    if let dictPont = jsonResult as? Dictionary<String, AnyObject> {
                        if let dataroot = dictPont["dataroot"] {
                            if let listP = dataroot["Ponto"] as? [Dictionary<String, AnyObject>] {
                                let pCount = listP.count
                                var index = 0
                                var tipo = " "
                                selectTipo1.append("Todos")
                                while index != pCount {
                                    if let tipo1 = listP[index]["Tipo"] as? String {
                                        tipo = tipo1
                                    }
                                    selectTipo1.append(tipo)
                                    index = index + 1
                                }
                                selectTipo = selectTipo1.removeDuplicates()
                            }
                        }
                    }
                }
            } catch {
                print("Could not serialize Tipo")
            }
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let ponto = self.pontos[indexPath.row]
        self.performSegueWithIdentifier("MoveDetailPontos", sender: nil)
    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        <#code#>
//    }
    
}

