//
//  DoubleComponentPickerViewController.swift
//  Pickers
//
//  Created by PavelM on 06/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    
    @IBOutlet var doublePicker: UIPickerView!
    
    // Outlets
    
    private let shortNameComponent = 0
    private let fullNameComponent = 1
    private let firstArray = ["RU","BLR","KZ","UKR","UZB"]
    private let secondArray = ["RUSSIA","BELARUS","KAZAHTAN","UKRAIN","UZBEKISTAN"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    
    
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let shortRow = doublePicker.selectedRow(inComponent: 0)
        let longRow = doublePicker.selectedRow(inComponent: 1)
        
        let short = firstArray[shortRow]
        let long = secondArray[longRow]
        
        let message = "Your choose \(short) + \(long)"
        
        let control = UIAlertController(title: "Что Выбрал?", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Хорошо", style: .cancel, handler: nil)
        
        control.addAction(action)
        present(control,animated: true,completion: nil)
    }
    
    // Actions
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return component == 0 ? firstArray.count : secondArray.count
    }
    
    // MARK: -
    // MARK: Picker Delegate Method
    
    func pickerView (_ pickerView: UIPickerView, titleForRow row: Int,forComponent component : Int ) -> String? {
        
        return component == 0 ? firstArray[row] : secondArray[row]
    }
    

    
}
