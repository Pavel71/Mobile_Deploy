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
// CLLocationManagerDelegate делегат достает данные по локации
// ChangeCityDelegate делегат передает название города из второго контроллера
class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    
    
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "9c85e3aadcf588831dad9e267120abb2"
    /***Get your own App ID at https://openweathermap.org/appid ****/
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    let button = UIButton()
    

    
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
        
        createAndPlaceButton()
        
        button.addTarget(self, action: #selector(secondViewButtonPressed), for: .touchUpInside)
        
        

        
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
        temperatureLabel.text = "\(weatherDataModel.temperature)°"
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
    
    // Когда делегат в следующей View запустит этот метод мы переместимся сюда и можем работать с этими данными!
    func userEnteredANewCityName(city: String) {
        let params : [String: String] = ["q": city, "appid": APP_ID]
        
        getWeatherData(params: params)
    }
    

    
    //Write the PrepareForSegue Method here
    // прежде чем перейти к следующей View подпишим делегат! Чтобы результат работы на следующей View отработал в этом классе!
    
    func createAndPlaceButton() {
        
        
        button.setTitle("Переход", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    // напишу ручной метод перехода к новому контроллеру
    @objc func secondViewButtonPressed() {
        
        print("Button")
        
       
    }

    // Это с использование storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "changeCityName" {

            let destinationVC = segue.destination as! ChangeCityViewController

            destinationVC.delegate = self
        }
    }
    
    // Впринципие с делегатами понятно! Это достаточно мощная модель по обмену данными между View!
    
    
}


