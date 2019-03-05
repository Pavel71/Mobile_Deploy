//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var displayLabel: UILabel!

  var firstNumber: String!
  
  
  
  private var isFinishingTypingNumber = true
  
  
  private var displayValue: Double {
  
    get {
      guard let number = Double(displayLabel.text!) else {
        fatalError("Не смогли конверитровать в double")
      }
      return number
    }
    
    set {

      let stringValue = String(newValue)
      
      let indexDotZeroString = stringValue.index(stringValue.endIndex, offsetBy: -2)
      
      // если на конце .0
      displayLabel.text =  stringValue[indexDotZeroString...] == ".0" ? String(stringValue[stringValue.startIndex..<indexDotZeroString]): stringValue
    }
    
  }
  
  // Изначально не дает текущее свойство передать так как его еще может и не быть
  
  // MARK: Created ModelStruct
  private var calculatedStruct = CalculatedLogic()

  
  @IBAction func calcButtonPressed(_ sender: UIButton) {
    
    
    isFinishingTypingNumber = true
    
    // Помещаем в структуру текущее число с экрана
    calculatedStruct.setNumber(displayValue)
    
    // Лучше работать через Гарды! Они позволяют сразу же дебажить код
    // Передаем операцию которую нужно сделать
    guard let result = calculatedStruct.calculated(operationString: sender.currentTitle!) else {
      
      fatalError("Ошибка! Мы не обработали операцию метод calculated")
    }
    
    // Выводим на экран результат операции
    displayValue = result

  }
  
  
  @IBAction func numButtonPressed(_ sender: UIButton) {
    
    // Это решение от Angella
    if let senderString = sender.currentTitle {
      
      if isFinishingTypingNumber {
        
        displayLabel.text = senderString
        isFinishingTypingNumber = false
        
      } else {
        
        if senderString == "." {

          // Будет true Когда мы получаем круглый Double
          let isInt = floor(displayValue) == displayValue
          
          // Если добавить еще . то получим false
          if !isInt {
            return
          }
        }
        displayLabel.text = displayLabel.text! + senderString
      }
      
    }
    

  }
  
}

