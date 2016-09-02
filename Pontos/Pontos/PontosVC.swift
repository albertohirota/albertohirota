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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.pontosPicker.delegate = self
        self.pontosPicker.dataSource = self
        selectTipo = ["Todos", "Abertura", "Oxala", "Xango", "Omolu", "Oxum", "Oxossi", "Ogum", "Iansa", "Iemanja", "Exu", "Pomba Gira", "Caboclos", "Pretos Velhos", "Pai e Vovo", "Tio e Tia", "Criancas", "Povos", "Catimbo"]
     
        
        
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
        return self.pontos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("PontoCell", forIndexPath: indexPath) as? PontoCell {
            let ponto = self.pontos[indexPath.row]
            cell.configureCell(ponto)
            return cell
        } else {
            return PontoCell()
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let ponto = self.pontos[indexPath.row]
        self.performSegueWithIdentifier("MoveDetailPontos", sender: nil)
    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        <#code#>
//    }
    
}

