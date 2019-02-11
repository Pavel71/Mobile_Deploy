import UIKit





func fibo(_ numbFibo: Int) {
    
    
    var array = [0,1,1,2]
    
    if numbFibo <= 2 {
        
        print(array.description)
        
    } else {
        
        for _ in 2...numbFibo - 1 {
            
            let prednumb = array[array.count - 2]
            let last = array.last!
            
            array.append(prednumb + last)
        }
    }
    
    print(array.description)
    
    
}

fibo(5)

func fidboCorrect(_ fiboNum: Int) {
    
    
    var num1 = 0
    var num2 = 1
    
    
    print(num1)
    print(num2)
    for _ in 0...fiboNum {
        
        
        
        let num = num1 + num2
        
        num1 = num2
        num2 = num
        print(num)
    }
}

fidboCorrect(5)
