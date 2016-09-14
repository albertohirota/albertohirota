//
//  PontosVC.swift
//  Pontos
//
//  Created by Alberto Hirota on 8/31/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit
import StoreKit
import CoreData


class PontosVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UISearchBarDelegate, UISplitViewControllerDelegate, UIAlertViewDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var pontosPicker: UIPickerView!
    @IBOutlet weak var tableView: UITableView!

    var pontos = Pontos.createPontos()
    var selectTipo: [String] = [String]()
    var inPickerMode = false
    var inSearchMode = false
    static var appPaid = false
    var selectTipo1: [String] = [String]()
    var pickerSelected: String?
    var filteredPicker = Pontos.createPontos()
    var filteredSearcher = Pontos.createPontos()
    var filteredAndSearchPicker = Pontos.createPontos()
    var selectedPonto = Pontos()
    var product = [SKProduct]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.allowsSelectionDuringEditing = false
        //appPaid()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.pontosPicker.delegate = self
        self.pontosPicker.dataSource = self
        self.searchBar.delegate = self
        selectType()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PontosVC.dismissKeyboard))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        self.splitViewController?.preferredDisplayMode = .AllVisible
        self.splitViewController?.delegate = self
        //requestProduct()
        
    }
   
    
//    func requestProduct() {
//        let ids: Set<String> = ["xxxxxxxxxx"]
//        let productRequest = SKProductsRequest(productIdentifiers: ids)
//        productRequest.delegate = self
//        productRequest.start()
//    }
//    func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
//        print("Product ready: \(response.products)")
//        print("Product ready: \(response.products.count)")
//        print("Product Not ready: \(response.invalidProductIdentifiers)")
//        self.product = response.products
//    }
//    func openDatabase() -> COpaquePointer {
//        //let path = NSBundle.mainBundle().pathForResource("Pontos", ofType: "sqlite")
//        let documents = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
//        let fileURL = documents.URLByAppendingPathComponent("Pontos.sqlite").path!
//        var db: COpaquePointer = nil
//        if sqlite3_open(fileURL!, &db) == SQLITE_OK {
//            print(" Successfully opened connection to database at \(fileURL)")
//            return db
//        } else {
//            print("Error to open Database")
//        }
//    }
        func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        return true
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
        if inPickerMode && inSearchMode {
            return self.filteredAndSearchPicker.count
        } else if inPickerMode {
            return self.filteredPicker.count
        } else if inSearchMode {
            return self.filteredSearcher.count
        } else {
            return self.pontos.count
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = self.tableView!.dequeueReusableCellWithIdentifier("PontoCell", forIndexPath: indexPath) as? PontoCell {
            if inPickerMode && inSearchMode {
                let ponto = self.filteredAndSearchPicker[indexPath.row]
                cell.configureCell(ponto)
                return cell
            } else if inSearchMode {
                let ponto = self.filteredSearcher[indexPath.row]
                cell.configureCell(ponto)
                return cell
            } else if inPickerMode {
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
//    func appPaid() {
//        PontosVC.locked = false
//        
//    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerSelected = selectTipo[row]
        if inSearchMode {
            if pickerSelected == "Todos" {
                inPickerMode = false
                tableView.reloadData()
            } else if pickerSelected == "Desbloqueados" {
                inPickerMode = true
                filteredAndSearchPicker = filteredSearcher.filter({$0.locked == "0"})
                tableView.reloadData()
            } else if pickerSelected == "Favoritos" {
            
            } else {
                inPickerMode = true
                filteredAndSearchPicker = filteredSearcher.filter({$0.tipo == pickerSelected})
                tableView.reloadData()
            }
        } else {
            if pickerSelected == "Todos" {
                inPickerMode = false
                tableView.reloadData()
            } else if pickerSelected == "Desbloqueados" {
                inPickerMode = true
                filteredPicker = pontos.filter({$0.locked == "0"})
                tableView.reloadData()
            } else if pickerSelected == "Favoritos" {
                inPickerMode = true
                filteredPicker = pontos.filter({$0.favorito == true})
                tableView.reloadData()
            } else {
                inPickerMode = true
                filteredPicker = pontos.filter({$0.tipo == pickerSelected})
                tableView.reloadData()
            }
        }
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if inPickerMode {
            if searchBar.text == nil || searchBar.text == "" {
                inSearchMode = false
                view.endEditing(true)
                tableView.reloadData()
            } else {
                inSearchMode = true
                let lower = searchBar.text!.lowercaseString
                filteredAndSearchPicker = filteredPicker.filter({$0.keyWord.rangeOfString(lower) != nil})
                tableView.reloadData()
            }
        } else {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            filteredSearcher = pontos.filter({$0.keyWord.rangeOfString(lower) != nil})
            tableView.reloadData()
        }
        }
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
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
                                selectTipo.append("Favoritos")
                                selectTipo.append("Desbloqueados")
                            }
                        }
                    }
                }
            } catch {
                print("Could not serialize Tipo")
            }
        }
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if inPickerMode && inSearchMode {
            let ponto = filteredAndSearchPicker[indexPath.row]
            self.selectedPonto = ponto
        } else if inSearchMode {
            let pontoS = filteredSearcher[indexPath.row]
            self.selectedPonto = pontoS
        } else if inPickerMode {
            let pontoP = filteredPicker[indexPath.row]
            self.selectedPonto = pontoP
        } else {
            let ponto = self.pontos[indexPath.row]
            self.selectedPonto = ponto
        }
        if selectedPonto.locked == "1" {
            let alert = UIAlertController(title: "Ponto Bloqueado", message: "Gostaria de adquirir o aplicativo e ter acesso a todos a mais de 1000 Pontos?", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "SIM", style: .Default, handler: { (action: UIAlertAction!) in
                print("user clicked YES")
            }))
            alert.addAction(UIAlertAction(title: "NÃO", style: .Cancel, handler: { (action: UIAlertAction!) in
                print("User cancelled")
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            performSegueWithIdentifier("DetailPontosVC", sender: nil)
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailPontosVC" {
            if let detailPontosVC = segue.destinationViewController as? DetailPontosVC {
                detailPontosVC.pontos = self.selectedPonto
            }
        }
    }
}

