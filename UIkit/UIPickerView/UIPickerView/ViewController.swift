//
//  ViewController.swift
//  UIPickerView
//
//  Created by PavelM on 04/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//
//////////////////////// PICKER ////////////

import UIKit

class ViewController: UIViewController {
    
    let picker = UIPickerView()
    let datepicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        picker.frame = CGRect(x: 100, y: 100, width: 150, height: 150)
        datepicker.frame = CGRect(x: 50, y: 250, width: 350, height: 350)
        
        // таймер обратного отсчета
        datepicker.datePickerMode = .countDownTimer
        datepicker.countDownDuration = 2 * 60
        
        
        // настройка datepicker
//        datepicker.datePickerMode = .date
        
        var oneYearTime = TimeInterval()
        oneYearTime = 365 * 24 * 60 * 60
        
        let todyDate = Date()
        
        let oneYearFromToday = todyDate.addingTimeInterval(oneYearTime)
        let twoYearFromToday = todyDate.addingTimeInterval(2 * oneYearTime)
        
        datepicker.minimumDate = oneYearFromToday
        datepicker.maximumDate = twoYearFromToday
        
        datepicker.addTarget(self, action: #selector(getDate(datepicker:)), for: .valueChanged)
        
        // Подписаться на протокол
        picker.dataSource = self
        picker.delegate = self
        
        
        self.view.addSubview(picker)
        self.view.addSubview(datepicker)
        
        
        
        
    }
    
    @objc func getDate(datepicker: UIDatePicker) {
        
        
        if datepicker.isEqual(self.datepicker) {
            
            print(datepicker.date)
        }
        
    }

}

// DataPicker



extension ViewController: UIPickerViewDataSource {
    
    // Реалзицем обязательные методы
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

extension ViewController: UIPickerViewDelegate {
        
        // Реалзицем обязательные методы
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "row = \(row)"
        return result
    }
    
    
    
}

