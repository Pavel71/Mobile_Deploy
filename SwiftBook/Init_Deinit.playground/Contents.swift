import UIKit

///////////////////// ИНИЦИАЛИЗАТОРЫ и ДЕИНИЦИАЛИЗАТОРЫ ///////

// Вспомогательный инициализатор


class Dog_init: Quadruped {
    
    override init(){
        super.init()
        self.type = "dog"
    }
    
    convenience init(text: String){
        self.init()
        print(text)
    }
    
    func bark(){
        print("woof")
    }
    
    func printName(){
        print(self.name)
    }
}

var myDog = Dog_init(text: "Wasap NIGA")


///// Проваливающийся инициализатор ////////


class Rectangle{
    
    var height: Int
    var weight: Int
    
    init?(height h: Int, weight w: Int){
        self.height = h
        self.weight = w
        if !(h > 0 && w > 0) {
            return nil
        }
        
    }
}

var rectangle = Rectangle(height: 56, weight: -32)

enum TemperatureUnit {
    
    case Kelvin, Celsius, Fahrenheit
    
    init?(symbol: Character) {
        
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

//let fahrenheitUnit = TemperatureUnit(symbol: "F")

// Если перечисление имеет встроенное значение то унеог есть встроенный проваливающийся инициализатор
enum TemperatureUnit_Raw: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}
let fahrenheitUnit = TemperatureUnit_Raw(rawValue: "F")
fahrenheitUnit!.hashValue


//// Обязательный инициализатор ////


//required init() {
//
//    /// тело инициализатора
//}

//////////// Deinit ////////

class SuperClass {
    
    init?(isNil: Bool){
        
        if isNil == true {
            return nil
        }else{
            print("Экземпляр создан")
        }
    }
    
    deinit {
        print("Деинициализатор суперкласса")
        
    }
    
}


class SubClass:SuperClass{
    
    deinit {
        print("Деинициализатор подкласса")
        
    }
    
}

var obj = SubClass(isNil: false)
obj = nil

