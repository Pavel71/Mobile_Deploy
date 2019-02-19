//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    let cashSimbol = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    
    var numberSimbols = 0
    
    var finalURL = ""
    
    var bitcoinKey = "NGRhYzZmYTc5ZDhhNDZlNGExZWEyYzE2ZjI0NzliOGM"

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        // На старте попросим сразу вывести цену на первый элемент pickera
        
        getCostApi(url: baseURL + currencyArray[0] )
       
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        numberSimbols = row
        finalURL = baseURL + currencyArray[row]
        
        getCostApi(url: finalURL)
        
    }

    
    
    
    //MARK: - Networking
    //***************************************************************/
    
    
    func getCostApi(url: String) {
        
        
        Alamofire.request(url).responseJSON { response in
            
                    if response.result.isSuccess {
    
//                        print("Sucess! Got the cost data")
                        let costJSON : JSON = JSON(response.result.value!)
                        
                        self.updateJSONdata(json: costJSON)
    
                    } else {
                        print("Error: \(String(describing: response.result.error))")
                        self.bitcoinPriceLabel.text = "Connection Issues"
                    }
                }
        
    }
    

    //MARK: - JSON Parsing
    //***************************************************************/
    
    // Метод по обработки данных json и вывод н label
    func updateJSONdata(json: JSON) {
        
        var resultString = "Result dont found"
        // Если результат пришел значи все норм
        if let resultLastCoast = json["last"].double {
            
            resultString = cashSimbol[numberSimbols] + String(resultLastCoast)
        }
        
        bitcoinPriceLabel.text = resultString
  
    }
    

}

