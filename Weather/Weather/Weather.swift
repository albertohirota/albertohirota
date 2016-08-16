//
//  Weather.swift
//  Weather
//
//  Created by Alberto Hirota on 8/15/16.
//  Copyright © 2016 Alberto Hirota. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    private var _urlWeather: String = "http://api.openweathermap.org/data/2.5/weather?lat="
    private var _urlForecast: String = "http://api.openweathermap.org/data/2.5/forecast?lat="
    private var _apiKey: String = "&APPID=fb87404ddb00d4e8695017b02dd4b36f"
    private var _city: String!
    private var _temperature: String!
    private var _weatherCond: String!
    private var _tempMin: String!
    private var _tempMax: String!
    private var _wind: String!
    private var _humidity: String!
    private var _condNextDay1: String!
    private var _tempMin1: String!
    private var _tempMax1: String!
    private var _condNextDay2: String!
    private var _tempMin2: String!
    private var _tempMax2: String!
    private var _condNextDay3: String!
    private var _tempMin3: String!
    private var _tempMax3: String!
    private var _condNextDay4: String!
    private var _tempMin4: String!
    private var _tempMax4: String!
    private var _condNextDay5: String!
    private var _tempMin5: String!
    private var _tempMax5: String!
    
   internal func downloadWeather(latitu: String, longit: String) {
        let url = NSURL(string: "\(_urlWeather)\(latitu)&lon=\(longit)\(_apiKey)&units=metric")!
        //let str = "http://api.openweathermap.org/data/2.5/weather?lat=43&lon=-79&APPID=fb87404ddb00d4e8695017b02dd4b36f"
        //let url = NSURL(string: str)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
//            print(url)
//            print(result.value.debugDescription)
//            print(response.result)
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let city = dict["name"] as? String {
                    self._city = city
                    //print(self._city)
                }
                if let main1 = dict["main"] where main1.count > 0  {
                    print(main1.debugDescription)
                    if let temp = main1["temp"] as? Int {
                        self._temperature = "\(temp)"
//                        print(self._temperature)
                    }
                    if let humidity = main1["humidity"] as? Int {
                        self._humidity = "\(humidity)"
//                        print(self._humidity)
                    }
                    if let tempMax = main1["temp_max"] as? Int {
                        self._tempMax = "\(tempMax)"
//                        print(self._tempMax)
                    }
                    if let tempMin = main1["temp_min"] as? Int {
                        self._tempMin = "\(tempMin)"
//                        print(self._tempMin)
                    }
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let icon = weather[0]["icon"] as? String {
                        self._weatherCond = icon
//                        print(self._weatherCond)
                    }
                }
                if let windy = dict["wind"] {
                    if let speed = windy["speed"] {
                        self._wind = "\(speed)"
//                        print(self._wind)
                    }
                }
            }
        }
    }
    func downloadForecast(latitu: String, longit: String) {
        let url = NSURL(string: "\(_urlForecast)\(latitu)&lon=\(longit)\(_apiKey)&units=metric")!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            print(url)
            print(result.value.debugDescription)
            if let dictF = result.value as? Dictionary<String, AnyObject> {
                if let listF = dictF["list"] as? [Dictionary<String, AnyObject>] {
                    if let main1 = listF[0]["main"] {
                        if let tempMin1 = main1["temp_min"] as? Int {
                            self._tempMin1 = "\(tempMin1)"
                        }
                        if let tempMax1 = main1["temp_max"] as? Int {
                            self._tempMax1 = "\(tempMax1)"
                        }
                    }
                    if let weather1 = listF[0]["weather"] {
                        if let icon1 = weather1[0]["icon"] as? String {
                            self._condNextDay1 = icon1
                        }
                    }
                    if let main2 = listF[1]["main"] {
                        if let tempMin2 = main2["temp_min"] as? Int {
                            self._tempMin2 = "\(tempMin2)"
                        }
                        if let tempMax2 = main2["temp_max"] as? Int {
                            self._tempMax2 = "\(tempMax2)"
                        }
                    }
                    if let weather2 = listF[1]["weather"] {
                        if let icon2 = weather2[0]["icon"] as? String {
                            self._condNextDay2 = icon2
                        }
                    }
                    if let main3 = listF[2]["main"] {
                        if let tempMin3 = main3["temp_min"] as? Int {
                            self._tempMin3 = "\(tempMin3)"
                        }
                        if let tempMax3 = main3["temp_max"] as? Int {
                            self._tempMax3 = "\(tempMax3)"
                        }
                    }
                    if let weather3 = listF[2]["weather"] {
                        if let icon3 = weather3[0]["icon"] as? String {
                            self._condNextDay3 = icon3
                        }
                    }
                    if let main4 = listF[3]["main"] {
                        if let tempMin4 = main4["temp_min"] as? Int {
                            self._tempMin4 = "\(tempMin4)"
                        }
                        if let tempMax4 = main4["temp_max"] as? Int {
                            self._tempMax4 = "\(tempMax4)"
                        }
                    }
                    if let weather4 = listF[3]["weather"] {
                        if let icon4 = weather4[0]["icon"] as? String {
                            self._condNextDay1 = icon4
                        }
                    }
                    if let main5 = listF[4]["main"] {
                        if let tempMin5 = main5["temp_min"] as? Int {
                            self._tempMin5 = "\(tempMin5)"
                        }
                        if let tempMax5 = main5["temp_max"] as? Int {
                            self._tempMax5 = "\(tempMax5)"
                        }
                    }
                    if let weather5 = listF[4]["weather"] {
                        if let icon5 = weather5[0]["icon"] as? String {
                            self._condNextDay5 = icon5
                        }
                    }
//                    print(self._condNextDay1)
//                    print(self._tempMax1)
//                    print(self._tempMin1)
                }
            }
        }
    }
}
