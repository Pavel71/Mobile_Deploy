//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "9c85e3aadcf588831dad9e267120abb2"
    /***Get your own App ID at https://openweathermap.org/appid ****/
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Поставлю здесь растягивание текста по всему label
        cityLabel.sizeToFit()
        
        
        //TODO:Set up the location manager here.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    func getWeatherData(params: [String: String]) {
        // Этот метод использует библиотеку Alamofire для http запроса
        Alamofire.request(WEATHER_URL, method: .get, parameters: params).responseJSON { respons in
            
            if respons.result.isSuccess {
                
                print("Respons Sucsess")
                
                let weatherJSON : JSON = JSON(respons.result.value!)
                self.updateWeatherData(json: weatherJSON)
                
            } else {
                
                print(respons.result.error!)
                self.cityLabel.text = "Connection Issues"
            }
            
        }
        
    }

    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    
    func updateWeatherData(json: JSON) {
        
        // Сообщение пришло но с ошибкой
        if let tempResult = json["main"]["temp"].double {
            
            weatherDataModel.temperature = Int(tempResult - 273.15)
            
            weatherDataModel.city = json["name"].stringValue
            
            weatherDataModel.condition = json["weather"][0]["id"].intValue
            
            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition:weatherDataModel.condition )
            
            updateUIwithWeatherData()
            
        } else {
            
            cityLabel.text = "Weather Unavaileble"
        }
 
    }
    
    
    
    //MARK: - UI Updates
    /***************************************************************/
 
    
    
    //Write the updateUIWithWeatherData method here:
    
    func updateUIwithWeatherData() {
        
        
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = "\(weatherDataModel.temperature)"
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
    }
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Сначала проверим данные на валидность! Если данные валидные останавливаем обновление чтобы не сажать батарейку
        // Последняя локация из списка
        let location = locations.last!
        
        if location.horizontalAccuracy > 0 {
            
            locationManager.stopUpdatingLocation()
            // Это делается для того чтобы 1 раз чекнуть погоду по локации
            locationManager.delegate = nil
        }
        
        // Берем координаты для передачи на Api
        let latitude = String(location.coordinate.latitude)
        let longitude = String(location.coordinate.longitude)

        
        // Соберем данные для формирвоания строки для Api
        
        let dataDict: [String:String] = ["lat": latitude,"lon":longitude, "appid": APP_ID]
        
        getWeatherData(params: dataDict)
        
    }
    
    
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        // Если ошибка то выведим это на экран
        print(error)
        cityLabel.text = "Location Unavalable"
        
    }
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
    
    
}


