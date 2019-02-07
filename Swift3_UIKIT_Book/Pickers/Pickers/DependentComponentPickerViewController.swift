//
//  DependentComponentPickerViewController.swift
//  Pickers
//
//  Created by PavelM on 06/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var dependetPicker: UIPickerView!
    
    // Outlets
    
    private let stateComponent = 0
    private let zipComponent = 1
    
    private var stateZips: [String: [String]]!
    private var states: [String]!
    private var zips: [String]!
    
    
    
    private let shortArray = ["RU","BLR","KZ","UKR","UZB"]
    private let longArray = ["RUSSIA","BELARUS","KAZAHTAN","UKRAIN","UZBEKISTAN"]
    
    private var countryDict: [String:String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryDict = Dictionary(uniqueKeysWithValues: zip(shortArray,longArray))
        
        
    }
    

    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let shortRow = dependetPicker.selectedRow(inComponent: stateComponent)
        let longRow = dependetPicker.selectedRow(inComponent: zipComponent)
        
        let short = shortArray[shortRow]
        let long = longArray[longRow]
        
        let title = "You selected \(short)"
        let message = "\(short) is \(long)"
        
        let controll = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        controll.addAction(action)
        present(controll, animated: true,completion: nil)
        
        
        
    }
    
    // Actions
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return component == 0 ? shortArray.count : longArray.count
    }
    
    
    //MARk: Delegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return component == 0 ? shortArray[row] : longArray[row]
    }
    
    // Метод устанавливающий зависимость от выбранных компонентов
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            
            let selectedShort = shortArray[row]
            let selectedLong = countryDict[selectedShort]!
            
            dependetPicker.reloadComponent(1)
            dependetPicker.selectRow(0, inComponent: 1, animated: true)
        }
        
    }
    
}
