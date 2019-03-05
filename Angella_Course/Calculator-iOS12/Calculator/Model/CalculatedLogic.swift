//
//  CalculatedLogic.swift
//  Calculator
//
//  Created by PavelM on 05/03/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation


struct CalculatedLogic {
  
  // Для обучения предлагается создать property
  
  private var numberOnLabel: Double?
  private var tupleOperationAndNumb: (symbol: String,number: Double)?
  
  mutating func setNumber(_ number: Double) {
    
    numberOnLabel = number
  }
  
  
  // для простототы передал в методе
  mutating func calculated(operationString: String) -> Double? {
    
    var resultDouble = numberOnLabel
    
    if let numbDouble = numberOnLabel {

      switch operationString {
      case "+/-":
        resultDouble = numbDouble * -1
      case "%":
        resultDouble = numbDouble / 100
      case "AC":
        resultDouble = 0.0
        
        // При очищении занулим и сохраненую переменную
        if tupleOperationAndNumb != nil {
          tupleOperationAndNumb?.number = resultDouble!
          
        }
        
      case "+":
        tupleOperationAndNumb = (operationString, numbDouble)
      case "-":
        tupleOperationAndNumb = (operationString, numbDouble)
      case "÷":
        tupleOperationAndNumb = (operationString, numbDouble)
      case "×":
        tupleOperationAndNumb = (operationString, numbDouble)
        
      case "=":
        resultDouble = performTwoNumCalculation(numbDouble)

      default: break
        
      }
      
    }
    return resultDouble
    
    
  }
  
  // Напишу функцию расчета значений
 private func performTwoNumCalculation(_ numbDouble: Double) -> Double{
    
    var resultDouble = 0.0
  
    if let tuple = tupleOperationAndNumb {
      
      switch tuple.symbol {
        
      case "+":
        resultDouble = tuple.number + numbDouble
      case "-":
        resultDouble = tuple.number - numbDouble
      case "÷":
        resultDouble = tuple.number / numbDouble
      case "×":
        resultDouble = tuple.number * numbDouble
      default:
        fatalError("Не смогли рассчитать Результат")
      }

    }
    
    return resultDouble
    
  }
  
}
