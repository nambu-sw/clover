//
//  HourlyWeather.swift
//  Clover
//
//  Created by MIJI SUH on 2021/12/03.
//

import Foundation

class HourlyWeather {
    
    private var _date:String!
    private var _weather:String!
    private var _temp:Double!
    private var _description:String!
    
    var date: String{
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var weather: String{
        if _weather == nil{
            _weather = ""
        }
        return _weather
    }
    
    var temp: Double{
        if _temp == nil{
            _temp = 0.0
        }
        return _temp
    }
    
    var description: String{
        if _description == nil{
            _description = ""
        }
        return _description
    }
    
    init(weatherDict: Dictionary<String, AnyObject>){
        if let dayTemp = weatherDict["temp"] as? Double{
            let rawValue = (dayTemp - 273.15).rounded(toPlaces: 0)
            self._temp = rawValue
        }
        if let date = weatherDict["dt"] as? Double{
            let rawDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH"
            self._date = dateFormatter.string(from: rawDate)
        }
        if let weather = weatherDict["weather"]![0] as? Dictionary<String, AnyObject>{
            let descript = weather["description"] as? String
            if descript == "overcast clouds"{
                self._weather = "overcast"
            }
            else{
                if let main = weather["main"] as? String {
                    self._weather = main
                }
            }
        }
    }
    
}
