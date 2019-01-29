import UIKit

////////////// Наследование ////////////

// суперкласс
class Quadruped {
    var type = ""
    var name = ""
    func walk(){
        print("walk")
    }
}

class Dog: Quadruped {
    func bark(){
        print("woof")
    }
}

var dog = Dog()
dog.type = "dog"
//dog.walk() // выводит walk 18
//dog.bark() // выводит woof

/// переопределение метода

class NoisyDog: Dog{
    override func bark(){
        print ("woof")
        print ("woof")
        print ("woof")
    }
}
var badDog = NoisyDog()
//badDog.bark()


// Доступ к родительскому методу! Даже если мы переопределил

class NoisyDog_2: Dog{
    
    override func bark() {
        
        for _ in 1...3  {
            super.bark()
        }
    }
}

var badDog_2 = NoisyDog_2()
//badDog_2.bark()

/////// Переопределим инициализатор /////

class Dog_init: Quadruped {
    
    override init(){
        super.init()
        self.type = "dog"
    }
    
    func bark(){
        print("woof")
    }
    
    func printName(){
        print(self.name)
    }
    
}

//// Для защиты от наследование перед свойством или методом ставим final


// Все подклассы также относятся к типа родительского класса
var animalsArray: [Quadruped] = []
var someAnimal = Quadruped()
var myDog = Dog()
var badDog_3 = NoisyDog()
animalsArray.append(someAnimal)
animalsArray.append(myDog)
animalsArray.append(badDog_3)


// проверить наследие !
//if myDog is Quadruped {
//
//    print("YEs")
//}

// Чтобы вызвать методы которые не существую в Quadruped


for item in animalsArray {
    
    if let animal = item as? NoisyDog {
        animal.bark()
    }else if let animal = item as? Dog {
        animal.bark()
    }else{
        item.walk()
        
    }
}
