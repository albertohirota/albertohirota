//
//  DetailPontosVC.swift
//  Pontos
//
//  Created by Alberto Hirota on 2016-09-04.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit
import CoreData

class DetailPontosVC: UIViewController, UIPopoverPresentationControllerDelegate {
    
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
    @IBOutlet weak var addFavoriteBtn: UIButton!
    @IBOutlet weak var favoriteImg: UIImageView!

    @IBOutlet weak var hiddenImg: UIImageView!
    var favorites = [String]()
    var favor = false

    override func viewDidLoad() {
        super.viewDidLoad()
        updatePonto()
        hiddenImg.alpha = 0
        saudacaoPress(self)

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        saudacaoPress(self)
    }
    func updatePonto() {
        favoritesCheck()
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
        favoriteBool()
    }
    func favoriteBool() {
        if !favorites.contains(pontos.id) {
            favoriteImg.alpha = 0
            favor = false
        } else {
            favoriteImg.alpha = 1
            favor = true
        }
    }
    func favoritesCheck() {
        // fetch CoreData results, it always comes in an Array
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Favorites")
        do {
            let results = try managedContext.fetch(fetchRequest)
            
            //access attribute of result
            if results.count > 0 {
                var index = 0
                while index != (results.count) {
                    let favoritesS = results[index] as! NSManagedObject
                    if let favorite = favoritesS.value(forKey: "id") {
                        favorites.append("\(favorite)")
                        print("\(index) - \(favorite)")
                        index = index + 1
                    }
                }
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    @IBAction func favoritePressed(_ sender: UIButton) {
        if !favor {
            let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
            let managedContext = appDelegate.managedObjectContext
            let entity = NSEntityDescription.entity(forEntityName: "Favorites", in: managedContext)
            let favorite = NSManagedObject(entity: entity!, insertInto: managedContext)
            favorite.setValue(pontos.id, forKey: "id")
            managedContext.insert(favorite)
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save \(error), \(error.userInfo)")
            }
        } else {
            let appDelegateD = (UIApplication.shared.delegate as! AppDelegate)
            let managedContextD = appDelegateD.managedObjectContext
            let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Favorites")
            do {
                let results = try managedContextD.fetch(fetchRequest)

                let index = favorites.index(of: pontos.id)
                let ponto = results[index!] as! NSManagedObject
                managedContextD.delete(ponto)
                do {
                    try managedContextD.save()
                    
                } catch {
                    let fetchError = error as NSError
                    print(fetchError)
                }
            } catch {
                let fetchError = error as NSError
                print(fetchError)
            }
        }
        DispatchQueue.main.async {
            
        }
        updatePonto()
    }
    
    
    
    
        @IBAction func saudacaoPress(_ sender: AnyObject) {
        print("press")

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaudacaoVC" {
            let popoverVC = segue.destination 
            popoverVC.modalPresentationStyle = UIModalPresentationStyle.popover
            popoverVC.popoverPresentationController!.delegate = self
        }
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
    

