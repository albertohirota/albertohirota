//
//  ViewController.swift
//  Weather
//
//  Created by Alberto Hirota on 8/15/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dayOfWeekLbl: UILabel!
    @IBOutlet weak var tempMaxLbl: UILabel!
    @IBOutlet weak var tempMinLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var dayOfWeek1Lbl: UILabel!
    @IBOutlet weak var condImg1: UIImageView!
    @IBOutlet weak var tempMax1: UILabel!
    @IBOutlet weak var tempMin1: UILabel!
    @IBOutlet weak var dayOfWeek2: UILabel!
    @IBOutlet weak var condImg2: UIImageView!
    @IBOutlet weak var tempMax2: UILabel!
    @IBOutlet weak var tempMin2: UILabel!
    @IBOutlet weak var dayOfWeek3: UILabel!
    @IBOutlet weak var condImg3: UIImageView!
    @IBOutlet weak var tempMax3: UILabel!
    @IBOutlet weak var tempMin3: UILabel!
    @IBOutlet weak var dayOfWeek4: UILabel!
    @IBOutlet weak var condImg4: UIImageView!
    @IBOutlet weak var tempMax4: UILabel!
    @IBOutlet weak var tempMin4: UILabel!
    @IBOutlet weak var dayOfWeek5: UILabel!
    @IBOutlet weak var condImg5: UIImageView!
    @IBOutlet weak var tempMax5: UILabel!
    @IBOutlet weak var tempMin5: UILabel!
    
    var locationManager = CLLocationManager()
    var latitude: String?
    var longitude: String?
    var weather: Weather!
    typealias LocationComplete = () -> ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locateMe() { () -> () in }

        
        
    }
    
    func locateMe(completed: LocationComplete) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
           // locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.stopUpdatingLocation()
        }
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinations: CLLocationCoordinate2D = (manager.location?.coordinate)!
        let long = coordinations.longitude
        let lat = coordinations.latitude
        latitude = "\(lat)"
        longitude = "\(long)"
        print(long)
        print(lat)
    }
    @IBAction func updatePressed(sender: AnyObject) {
        locateMe(){ () -> () in }

        Weather().downloadWeather(latitude!, longit: longitude!)
        Weather().downloadForecast(latitude!, longit: longitude!)
        
    }
    func updateUI() {
        cityLbl.text = weather.city 
    }
    
}

