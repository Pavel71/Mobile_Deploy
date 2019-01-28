import UIKit

//////////////////////////////////////// ENUM ////////////////////////

enum CurrencyUnit {

    case rouble,dollar,euro

}

let roubleCurrency = CurrencyUnit.rouble

let dollarCurrency: CurrencyUnit = .dollar
dollarCurrency

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
Beverage.allCases


/////////////// HomeWork////////

enum Chessmans {

    case king,knight,bishop,tower,quen
}

let kingChess = Chessmans.king

//enum CurrencyUnit {
//
//    case rouble(сountries: [String], shortName: String)
//    case dollar(сountries: [String], shortName: String)
//    case euro(сountries: [String], shortName: String)
//}

//var roubleCurrency = CurrencyUnit.rouble(сountries:["Russia"], shortName: "RUB")







enum DollarCountries {

    case usa
    case canada
    case australia

}
//enum CurrencyUnit {
//
//    case rouble(сountries: [String], shortName: String)
//    case dollar(сountries: [String], shortName: String, national: DollarCountries)
//    case euro(сountries: [String], shortName: String)
//}


//let dollarCurrency = CurrencyUnit.dollar(сountries:["USA"],shortName: "USD", national: .usa)


/////// HomeWork /////



//enum Chessmans {
//
//    enum Color {
//        case wight
//        case black
//    }
//
//    case king(name: String ,color: Color)
//    case knight(name: String,color: Color)
//    case bishop(name: String,color: Color)
//    case tower(name: String,color: Color)
//    case quen(name: String,color: Color)
//}

//let kingWight = Chessmans.king(name:"Король", color: .wight)
//kingWight


// Вложенные перечисления

//enum CurrencyUnit {
//
//    enum DollarCountries {
//
//        case usa
//        case canada
//        case australia
//
//    }
//
//    case rouble(сountries: [String], shortName: String)
//    case dollar(сountries: [String], shortName: String, national: DollarCountries)
//    case euro(сountries: [String], shortName: String)
//}


//
//
//var someVar = CurrencyUnit.DollarCountries.australia
//someVar


///////// Switch c ENUM ////////

//var someCurrency = CurrencyUnit.rouble(сountries: ["Russia","Ukraine", "Belarus"], shortName: "RUB")

//var someCurrency = CurrencyUnit.euro(сountries: ["Germany,Itali,France"], shortName: "EUR")


//switch someCurrency {
//
//case .rouble:
//    print("Рубль.")
//
//case let.euro(countries, shortname):
//    print("Евро. Страны: \(String(describing: countries)),краткое наименование: \(shortname)")
//
//case .dollar(let countries, let shortname, let national):
//
//    print("Доллар \(national). Страны: \(String(describing:countries)) краткое наименование: \(shortname)")
//
//}



////// Исходное значение ////

//enum Smile: String {
//    case joy = ":)"
//    case laugh = ":D"
//    case sorrow = ":("
//    case surprise = "o_O"
//
//}

//let joy = Smile.joy
//print(joy.rawValue)

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus,
    neptune, pluton = 999
}

// Можно инициализировать перечеслине о по связанному значению
var myPlanet = Planet.init(rawValue: 3)
var anotherPlanet = Planet.init(rawValue: 11)


//// HomeWork ////

//enum Chessmans {
//
//    enum Color: String {
//        case wight = "Белый"
//        case black = "Черный"
//    }
//
//    case king(name: String ,color: Color)
//    case knight(name: String,color: Color)
//    case bishop(name: String,color: Color)
//    case tower(name: String,color: Color)
//    case quen(name: String,color: Color)
//}
//
//let bishop = Chessmans.bishop(name: "Слон", color: .wight)
//
//
//switch bishop {
//
//case let.bishop(name,color):
//    print("Это \(color.rawValue) \(name)")
//
//default:
//    print("нет в перечислении")
//}


////// Вычесляемые свойства //////

//enum Smile: String {
//
//    case joy = ":)"
//    case laugh = ":D"
//    case sorrow = ":("
//    case surprise = "o_O"
//    var description: String {return self.rawValue}
//
//}
//var mySmile: Smile = .sorrow
//mySmile.description


//enum Smile: String {
//    case joy = ":)"
//    case laugh = ":D"
//    case sorrow = ":("
//    case surprise = "o_O"
//    // метод для вывода описания 7 func description(){
//    func description(){
//    print("Перечисление содержит список используемых смайликов:их названия и графические обозначения")
//    }
//}
//var mySmile = Smile.joy
//mySmile.description()


enum Smile: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
    // метод для вывода описания 7 func description(){
    func description(){
        print("Перечисление содержит список используемых смайликов:их названия и графические обозначения")
    }
    func descriptonValue() -> Smile {
        
        return self
    }
    func descriptionRawValue() -> String {
        
        return self.rawValue
    }
}
var mySmile = Smile.joy
mySmile.descriptonValue()
mySmile.descriptionRawValue()

//enum ArithmeticExpression{
//    case addition(Int, Int)
//    case substraction(Int, Int)
//
//    func evaluate() -> Int {
//
//        switch self {
//
//        case .addition(let left, let right):
//            return left + right
//
//        case .substraction(let left, let right):
//            return left - right
//        }
//    }
//
//}

//var expr = ArithmeticExpression.addition(10, 14)
//expr.evaluate()


//// Возможность перечеслений вызывать свои же методы! херня какая то

enum ArithmeticExpression {
    
    // хранилище для операнда
    case number(Int)
    indirect case addition(ArithmeticExpression,ArithmeticExpression)
    
    indirect case subtraction(ArithmeticExpression,ArithmeticExpression)
    
    func evaluate(expression: ArithmeticExpression? = nil ) -> Int{
        
        let expression = (expression == nil ? self : expression)
        
        switch expression! {
            
        case .number( let value ):
            return value
            
        case .addition(let valueLeft, let valueRight):
            return self.evaluate( expression: valueLeft ) +
                self.evaluate( expression: valueRight )
            
        case .subtraction( let valueLeft, let valueRight ):
            return self.evaluate( expression: valueLeft ) - self.evaluate(expression: valueRight )
        }
    }
}

