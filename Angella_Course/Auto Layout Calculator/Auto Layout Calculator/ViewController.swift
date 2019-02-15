//
//  ViewController.swift
//  Auto Layout Calculator
//
//  Created by PavelM on 14/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.


import UIKit

class ViewController: UIViewController {
    
    
    var currentDouble: Double!
    var lastNumber = Double()
    var stringOperand = String()
    var flagNewValue = false
    
    var resultString = String() {
        
        didSet {
            
            currentDouble = Double(resultString)

            resultLabel.text = resultString

        }
    }
    
    @IBOutlet var resultLabel: UILabel!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultString = "0"
        
    }
    
    // Будет метод по обработке числовых кнопок и операндов
    @IBAction func numberButtonAndPoint(_ sender: UIButton) {
        
        let number = sender.titleLabel!.text!
        
        // Здесь идет проверка на 0 и нужно новое значение или добавляем к старому цифры?
        
        if resultString == "0" || flagNewValue {
            
            resultString = number
            flagNewValue = false
            
        } else {
           
            resultString += number
        }
        
    }
    
    
    // Сложение
    @IBAction func plusButton(_ sender: UIButton) {
        
        // как только нажали + Высчитали результат 0 + введенное число
        resultString = intString(string: String(lastNumber + currentDouble!))
        // Сохранили введеное число в память
        lastNumber = currentDouble!
        // Записаил операнд на случай =
        stringOperand = (sender.titleLabel?.text)!
        // Поставили флаг в значение что записываем нвоое число
        flagNewValue = true
        
    }
    
    
    
    // выводит результат на экран
    @IBAction func equalsButton(_ sender: UIButton) {

        switch stringOperand {

        case "+":
            
            resultString = intString(string: String(lastNumber + currentDouble!))
            
        default: break
        }

    }
    
    
    // Очищаем экран
    @IBAction func clearButton(_ sender: UIButton) {
        
        resultString = "0"
        lastNumber = 0.0
    }
    
    
    
    // Функция принимает строку и если на конце есть .0 то мы убираем это и выводим интовое число
    
    func intString(string: String) -> String {
        
        
        var result = ""
        
        if string.hasSuffix(".0") {
            
            let indexDotZero = string.index(string.endIndex, offsetBy: -2)
            
            result = String(string.prefix(upTo: indexDotZero))
            
        } else {
            
            result = string
        }
        
        return result
        
    }
}

