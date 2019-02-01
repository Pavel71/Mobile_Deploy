//
//  ViewController.swift
//  MiniCalc
//
//  Created by PavelM on 31/01/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

// Нужно разработать приложени складывающее цифр

// 1.Сначала добавлю дизайн
// 2.Логика

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var taskLabel: UILabel!
    
    var resultInt: Int!
    var humanResult: Int? {
        
        return Int(arrauResult.joined())
    }

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var numbersLabel: UILabel!
    @IBOutlet var printResult: UILabel!
    
   
    var arrauResult: [String] = []
    var checkBool: Bool = false

    // Нужен массив кнопок! чтобы можно было иденитфицировать
    
    // Ввод данных
    @IBAction func pushNumber(_ sender: UIButton) {
        
        let numberConst = sender.titleLabel?.text

        switch numberConst {
            
        case "<" where !arrauResult.isEmpty :
            arrauResult.removeLast()
        case "<":
            resultLabel.text = ""
        default:
            arrauResult.append(numberConst!)
        }
        
        resultLabel.text = arrauResult.joined()
        
        
//        if numberConst! == "<" && !arrauResult.isEmpty {
//            arrauResult.removeLast()
//
//        } else {}
        
        resultLabel.text = arrauResult.joined()
        
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        // Функция запускает работу приложения и выводит первое задание
        
        // Деалем проверку на пустату если начианем новую игру
        
        if !arrauResult.isEmpty {
            
            arrauResult.removeAll()
            resultLabel.text = nil
            printResult.text = nil
        }
        
        
        let number1 = Int(arc4random_uniform(100))
        let number2 = Int(arc4random_uniform(100))
        
        resultInt = number1 + number2
        
        numbersLabel.text = ("\(String(number1)) + \(String(number2))")
    }
    
    // Функция делает проверку и выдает результат!
    @IBAction func checkAction(_ sender: UIButton) {
        
        if let humanResultConst =  humanResult {
            
            printResult.text = humanResultConst == resultInt! ? "Правильно!" : "Ошибка!"
        }
        
        
    }

}
    

