//
//  main.swift
//  Sum_of_number
//
//  Created by PavelM on 31/01/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

func interfaceSum() {
    
    
    // получение первого аргумента
    var a: String?
    
    repeat {
        print("Введите значение первого аргумента")
        
        a = readLine()
        
    } while (Int(a!) == nil)
    
   
    // получение второго аргумента
    var b: String?
    repeat {
        
        print("Введите значение второго аргумента")
        b = readLine()
        
    } while (Int(b!) == nil)
    
    let result = sum(a,b)
    
    print("Результат суммы - \(result)")

}

interfaceSum()


