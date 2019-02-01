//
//  main.swift
//  What_Number
//
//  Created by PavelM on 31/01/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation

func stringToInt() -> UInt8? {
    /*
     Функция проверяет на переводи типа из строки в INT
     */
    
    var result : UInt8?
    
    repeat {
        // Получим либо nil-пустая строка или корявая строка с символами либо число Optional
        result = UInt8(readLine()!)
        
        if let consInt = result {
            
            result = consInt
            
        } else {print("Число с ошибкой! Повторите ввод!")}
        
    } while (result == nil)
    
    return result
}


func startTheGame() {
    
    var newGame: Bool = false
    
    repeat {
        
        let random = UInt8(arc4random_uniform(100))
        var numbInt : UInt8?
        
        print(random)
        
        print("Отгадайте число! Введите:")
        
        
        var flag: Bool = false
        
        while !flag {
            
            numbInt = stringToInt()
            
            switch numbInt {
                
            case random:
                print("Красава!")
                
                print("Хотите сиграть еще раз? Тогда напишите Да")
                let yesOrnot = readLine()!
                
                if yesOrnot.lowercased() == "да" {
                    newGame = true
                    print("Новая игра")
                }
                
                flag = true
                
            case _ where numbInt! < random:
                print("Меньше")
            case _ where numbInt! > random:
                print("Больше")
            default:
                print("Somethink wrong!")
                break
            }
        }
        
    } while newGame
    
    print("Конец игры")
    
    
}

startTheGame()
    



//    numbInt = stringToInt()
//    if numbInt! == random {
//        print("Красава!")
//        break
//    } else if numbInt! > random {
//        print("Больше")
//    } else {print("Меньше")}
//}





