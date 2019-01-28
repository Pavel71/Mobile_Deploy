import UIKit
/////////////////////////////////// SWITCH ////////////////////////

var userMark = 4


switch userMark{

case 1..<3:
    print("Экзамен не сдан!")
case 3,4,5:
    print("Экзамен сдан!")
default:
    assert(false, "Оценка \(userMark) вне доступного диапазона")

}

 //Каскадное выполнение fallthrough

/* переменная типа Character 2 содержит уровень
 3 готовности */

var level: Character = "А"


switch level {

case "А":
    print("Выключить все электрические приборы ")
    fallthrough
case "Б":
    print("Закрыть входные двери и окна ")
    fallthrough
case "В":
    print("Соблюдать спокойствие")
default:
    break

}


///////// Where /////////////////

var dragonWeight: Float = 2.4
var dragonHeight: Float = 245.5


var dragonColor = "зеленый"


switch dragonColor {

case "зеленый" where (dragonWeight > 2 && dragonHeight < 240):
    print("Поместите дракона в загон 1")

case "красный" where dragonWeight < 2:
    print("Поместите дракона в загон 2")

    // Если делаем перечисление то нужно писать для каждого цвета!
case "зеленый" where (dragonWeight >= 2 && dragonHeight < 240),
     "красный" where (dragonWeight >= 2 && dragonHeight < 240):

    print("Поместите дракона в загон 3")

default:
    break

}

var dragonCharacteristic = ("зеленый", 2.4)


switch dragonCharacteristic {

case ("зеленый", 0..<2):

    print("Поместите дракона в загон 1")

case ("красный", 0..<2):
    print("Поместите дракона в загон 2")

    // либо любой красный либо зеленый но со вторым параметром по условию
case ("красный", _),
     ("зеленый", _) where dragonCharacteristic.1 > 2:

    print("Поместите дракона в загон 3")
default:
    print("Нет дракона")
}




switch dragonCharacteristic {

case ("зеленый", 0..<2):
    print("Поместите дракона в загон 1")

case ("красный", 0..<2):
    print("Поместите дракона в загон 2")

// можно поерделить перемненные и првоерить по своим условиям
case let(color, weight) where (color == "зеленый" || color ==
    "красный") && weight >= 2:
    print("Поместите дракона в загон 3")

default:
    print("Дракон с неизвестными параметрами")
}

// HomeWork

typealias Operation = (operandOne: Float, operandTwo: Float,  operation: Character)

let first : Operation = (3.14, 33, "a")

switch first {
    
case let(numb1,numb2,_) where first.2 == "+":
    
    print(numb1 + numb2)
case let(numb1,numb2,_) where first.2 == "-":
    
    print(numb1 - numb2)
case let(numb1,numb2,_) where first.2 == "*":
    
    print(numb1 * numb2)
case let(numb1,numb2,_) where first.2 == "/":
    
    print(numb1 / numb2)
default:
    print("Non sign")
}
