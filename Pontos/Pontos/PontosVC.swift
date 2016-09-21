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
        self.splitViewController?.preferredDisplayMode = .allVisible
        self.splitViewController?.delegate = self
                //requestProduct()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
        print("reloadData")
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
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return selectTipo.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectTipo[row]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView!.dequeueReusableCell(withIdentifier: "PontoCell", for: indexPath) as? PontoCell {
            if inPickerMode && inSearchMode {
                let ponto = self.filteredAndSearchPicker[(indexPath as NSIndexPath).row]
                cell.configureCell(ponto)
                return cell
            } else if inSearchMode {
                let ponto = self.filteredSearcher[(indexPath as NSIndexPath).row]
                cell.configureCell(ponto)
                return cell
            } else if inPickerMode {
                let ponto = self.filteredPicker[(indexPath as NSIndexPath).row]
                cell.configureCell(ponto)
                return cell
            } else {
                let ponto = self.pontos[(indexPath as NSIndexPath).row]
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
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
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if inPickerMode {
            if searchBar.text == nil || searchBar.text == "" {
                inSearchMode = false
                view.endEditing(true)
                tableView.reloadData()
            } else {
                inSearchMode = true
                let lower = searchBar.text!.lowercased()
                filteredAndSearchPicker = filteredPicker.filter({$0.keyWord.range(of: lower) != nil})
                tableView.reloadData()
            }
        } else {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercased()
            filteredSearcher = pontos.filter({$0.keyWord.range(of: lower) != nil})
            tableView.reloadData()
            }
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    func selectType() {
        if let path = Bundle.main.path(forResource: "pontos", ofType: "json") {
            do {
                let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path))
                do {
                    let jsonResult = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.allowFragments)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if inPickerMode && inSearchMode {
            let ponto = filteredAndSearchPicker[(indexPath as NSIndexPath).row]
            self.selectedPonto = ponto
        } else if inSearchMode {
            let pontoS = filteredSearcher[(indexPath as NSIndexPath).row]
            self.selectedPonto = pontoS
        } else if inPickerMode {
            let pontoP = filteredPicker[(indexPath as NSIndexPath).row]
            self.selectedPonto = pontoP
        } else {
            let ponto = self.pontos[(indexPath as NSIndexPath).row]
            self.selectedPonto = ponto
        }
        if selectedPonto.locked == "1" {
            let alert = UIAlertController(title: "Ponto Bloqueado", message: "Gostaria de adquirir o aplicativo e ter acesso a todos a mais de 1000 Pontos?", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "SIM", style: .default, handler: { (action: UIAlertAction!) in
                print("user clicked YES")
            }))
            alert.addAction(UIAlertAction(title: "NÃO", style: .cancel, handler: { (action: UIAlertAction!) in
                print("User cancelled")
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "DetailPontosVC", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailPontosVC" {
            if let detailPontosVC = segue.destination as? DetailPontosVC {
                detailPontosVC.pontos = self.selectedPonto
            }
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.tableView.reloadData()
    }
}

