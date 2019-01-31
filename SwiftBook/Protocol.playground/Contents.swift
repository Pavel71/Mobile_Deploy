import UIKit

///////////// Protocol /////////////


// protocol for store properties

protocol SomeProtocol {
    
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
    
}

// protocol for type propertys

protocol AnotherProtocol {
    
    static var someTypeProperty: Int { get set }
    
}

//protocol FullyNamed {
//
//    var fullName: String { get }
//}
//
//struct Person: FullyNamed {
//    var fullName: String
//}
//
//let john = Person(fullName: "John Wick")


protocol RandomNumberGenerator {
    // метод экземпляра
    func random() -> Double
    // метод Типа без указания требования возвращаемого значения
    static func getRandomString()
    // Метода экземляра который меняет свойство экземляра
    mutating func changeValue(newValue: Double)
}

protocol Named {
    
    init(name: String)
}

class Person : Named {

    var name: String
    
    required init(name: String){
        self.name = name
    }
}


protocol TextRepresentable {
    func asText() -> String
}

extension Int: TextRepresentable {
    
    func asText() -> String {
    return String(self)
    }
}
5.asText()

// расширили старый протокол и его методы автоматически добавились всем Типам поддерживающие протокол! /////


extension TextRepresentable {
    func description() -> String {
        return "Данный тип поддерживает протокол TextRepresentable"        }
    }
5.description()



///// Наследование протокола /////////


protocol SuperProtocol {
    var someValue: Int { get }
}
protocol SubProtocol: SuperProtocol {
    func someMethod()
}
struct SomeStruct: SubProtocol{
    let someValue: Int = 10
    func someMethod() {
        
    }
    
}

/// Указываем что протокол должен наследоватся только классами а не структурами ///

protocol SubProtocol_2: class, SuperProtocol {
    func someMethod()
}


protocol Named_2 {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}

// Указываем что структура наследуюется от 2-х протоколов
struct Person_2: Named_2, Aged {
    var name: String
    var age: Int
}


func wishHappyBirthday(_ celebrator: Person_2) {
    
    print("С Днем рождения, \(celebrator.name)! Тебе уже \(celebrator.age)!")
    
}
var person = Person_2(name: "John Wick", age: 33)

wishHappyBirthday(person)
