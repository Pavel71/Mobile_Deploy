import UIKit

var str = "Hello, playground"

////////////////////// String ////////////////

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0

for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
//print("There are \(act1SceneCount) scenes in Act 1")


var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
//print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

//: Это веслеуха! // Так можно отобразить комментарий в поиске! Как TODO

//var number = 55; print(number)
//////////////////////////// Получение деления от остатка /////////////////
var x = 8.625
//print(x / 0.75)
// Prints "11.5"

let q = (x / 0.75).rounded(.towardZero)
// q == 11.0
x.formTruncatingRemainder(dividingBy: 0.75)
// x == 0.375

var int_1 = 10
var int_2 = 3
// получить остаток!
//int_1 % int_2

var someBool = true   // инвертируем значение
!someBool
someBool


///////////////////////////// OPTIONAL /////////////////////////

//var type = String()
//// принудительное извлечение опционального значения 3
//let monsterOneType: String? = "Дракон"
//type = monsterOneType!
//type
//// косвенное извлечение опционального значения
//let monsterTwoType: String! = "Тролль"
//type = monsterTwoType
//type
//
//
//
//
//typealias Text = String
//
//let numb1 : Text = "11"
//let numb2 : Text = "22"
//let numb3 : Text = "1aa1"
//
//
//if let consNumb = Int(numb1) {print(consNumb)}
//if let consNumb = Int(numb2) {print(consNumb)}
//if let consNumb = Int(numb3) {print(consNumb)}
//
//
//
//typealias TupleType = (numberOne: Text?, numberTwo: Text?)?
//
//let tupleOne : TupleType = ("190", "67")
//let tupleTwo : TupleType = ("100", nil)
//let tupleThree : TupleType = ("-65", "70")
//
////if let numbone = Int(tupleOne!.numberOne!), let numbtwo = Int(tupleOne!.numberTwo!) {
////
////    print(numbone,numbtwo)
////}
//
//
//
//if let tupleConst = tupleThree {
//
//    if let numberOne = tupleConst.numberOne, let numberTwo = tupleConst.numberTwo {
//
//        if let intOne = Int(numberOne), let intTwo = Int(numberTwo) {
//
//            print(intOne, intTwo)
//        } else {print("Element tuple can't convet to nil!")}
//
//
//    } else {print("Element tuple = nil")}
//} else {print("Tuple = nil")}


/////////////////////////////////// SWITCH ////////////////////////

var userMark = 4
// проверка значения с использованием диапазона 6 switch userMark {

//switch userMark{
//
//case 1..<3:
//    print("Экзамен не сдан!")
//case 3,4,5:
//    print("Экзамен сдан!")
//default:
//    assert(false, "Оценка \(userMark) вне доступного диапазона")
//
//}

// Каскадное выполнение fallthrough

/* переменная типа Character 2 содержит уровень
 3 готовности */
//var level: Character = "А"
// определение уровня готовности 6 switch level {

//switch level {
//
//case "А":
//    print("Выключить все электрические приборы ")
//    fallthrough
//case "Б":
//    print("Закрыть входные двери и окна ")
//    fallthrough
//case "В":
//    print("Соблюдать спокойствие")
//default:
//    break
//
//}


///////// Where /////////////////

//var dragonWeight: Float = 2.4
//var dragonHeight: Float = 245.5
//
//
//var dragonColor = "зеленый"
//
//
//switch dragonColor {
//
//case "зеленый" where (dragonWeight > 2 && dragonHeight < 240):
//    print("Поместите дракона в загон 1")
//
//case "красный" where dragonWeight < 2:
//    print("Поместите дракона в загон 2")
//
//    // Если делаем перечисление то нужно писать для каждого цвета!
//case "зеленый" where (dragonWeight >= 2 && dragonHeight < 240),
//     "красный" where (dragonWeight >= 2 && dragonHeight < 240):
//
//    print("Поместите дракона в загон 3")
//
//default:
//    break
//
//}

var dragonCharacteristic = ("зеленый", 2.4)


//switch dragonCharacteristic {
//
//case ("зеленый", 0..<2):
//
//    print("Поместите дракона в загон 1")
//
//case ("красный", 0..<2):
//    print("Поместите дракона в загон 2")
//
//    // либо любой красный либо зеленый но со вторым параметром по условию
//case ("красный", _),
//     ("зеленый", _) where dragonCharacteristic.1 > 2:
//
//    print("Поместите дракона в загон 3")
//default:
//    print("Нет дракона")
//}




//switch dragonCharacteristic {
//
//case ("зеленый", 0..<2):
//    print("Поместите дракона в загон 1")
//
//case ("красный", 0..<2):
//    print("Поместите дракона в загон 2")
//
//// можно поерделить перемненные и првоерить по своим условиям
//case let(color, weight) where (color == "зеленый" || color ==
//    "красный") && weight >= 2:
//    print("Поместите дракона в загон 3")
//
//default:
//    print("Дракон с неизвестными параметрами")
//}

// HomeWork

//typealias Operation = (operandOne: Float, operandTwo: Float,  operation: Character)
//
//let first : Operation = (3.14, 33, "a")
//
//switch first {
//
//case let(numb1,numb2,_) where first.2 == "+":
//
//    print(numb1 + numb2)
//case let(numb1,numb2,_) where first.2 == "-":
//
//    print(numb1 - numb2)
//case let(numb1,numb2,_) where first.2 == "*":
//
//    print(numb1 * numb2)
//case let(numb1,numb2,_) where first.2 == "/":
//
//    print(numb1 / numb2)
//default:
//    print("Non sign")
//}


///// Array///////

//let lineArray = Array(0...9)
//
//let repeatArray = Array(repeating: "Swift", count: 5)
//
//var mutableArray = [2, 4, 8]
//
//mutableArray[1] = 16
//mutableArray
//
//mutableArray[0...1] = [25]
//mutableArray
//
//// получить пустые массивы
//var emptyArray: [String] = []
//var anotherEmptyArray = [String]()
//
//var alphaArray = [String?](repeating: nil, count: 5)
//
//var arrayOfArrays = [[1,2,3], [4,5,6], [7,8,9]]
//arrayOfArrays[0][0]
//
//
//var someArray = [1, 2, 3, 4, 5]
//someArray.count
//someArray.isEmpty
//someArray.suffix(3)
//someArray.append(6)
//someArray.insert(100, at: 2)
//someArray.remove(at: 2)
//someArray.removeFirst()
//someArray.removeLast()
//
//let someArray_const = [1, 2, 3, 4, 5]
//someArray_const.dropLast()
//someArray_const.dropFirst(3)
//someArray_const
//
//var intArray = [1, 2, 3, 4, 5, 6]
//intArray.contains(4)
//
//intArray.index(of:4)
//intArray.index(of:99)
//intArray.min()
//intArray.max()
//intArray.reverse()
//intArray

////////////////////////////// SET //////////////////

//var dishes: Set<String> = ["хлеб", "овощи","тушенка", "вода"]
//var dishesTwo: Set = ["хлеб", "овощи","тушенка", "вода"]
//var members = Set(arrayLiteral: "Энекин", "Оби Ван", "Йода")
//
////var musicStyleSet: Set<String> = []
////musicStyleSet.insert("Jazz")
//
//var musicStyleSet: Set<String> = ["Jazz", "Hip-Hop", "Rock"]
//musicStyleSet.remove("Hip-Hop")
//musicStyleSet.remove("Classic")
//musicStyleSet.removeAll()
//musicStyleSet.contains("Funk")
//
//let evenDigits: Set = [0, 2, 4, 6, 8]
//let oddDigits: Set = [1, 3, 5, 7, 9]
//var differentDigits: Set = [3, 4, 7, 8]
//
//// Найти общие элементы!
//var inter = differentDigits.intersection(oddDigits).sorted()
//
//// Все непересикающиеся
//var exclusive = Set(differentDigits.symmetricDifference(oddDigits).sorted())
//
//var union = evenDigits.union(oddDigits).sorted()
//
//// Все что не входит!
//var subtract = differentDigits.subtracting(evenDigits).sorted()
//
//
//var aSet: Set = [1, 2, 3, 4, 5]
//var bSet: Set = [1, 3]
//
//if bSet.isSubset(of: aSet) {print("bSet — это субнабор для aSet")}
//aSet.isSuperset(of: bSet)
//
//
//var cSet: Set = [6, 7, 8, 9]
//if bSet.isDisjoint(with: cSet) {print("наборы bSet и cSet не пересекаются")}
//
//
//if bSet.isStrictSubset(of: aSet) {
//    print("bSet — субнабор для aSet") }
//if aSet.isStrictSuperset(of: bSet) {
//    print("aSet — супернабор для bSet") }

/////////////////// DICT //////////////////////

//let baseCollection = [(2, 5), (3, 6), (1, 4)]
//let newDictionary = Dictionary(uniqueKeysWithValues: baseCollection)
//
//
//let nearestStarNames = ["Proxima Centauri", "Alpha Centauri A", "Alpha Centauri B", "Barnard's Star", "Wolf 359"]
//let nearestStarDistances = [4.24, 4.37, 4.37, 5.96, 7.78]
//
//let starDistanceDict = Dictionary(uniqueKeysWithValues:zip(nearestStarNames, nearestStarDistances))
//
//var countryDict = ["RUS":"Россия", "BEL": "Беларусь", "UKR":"Украина"]
//countryDict["RUS"] = "Российская Федерация"
//
//countryDict.updateValue("Российская Федерация", forKey: "RUS")
//countryDict["TUR"] = "Турция"
//
//// Удаление!
//countryDict["UKR"] = nil
//countryDict.removeValue(forKey: "BEL")
//countryDict
//
//let myCountry: String = countryDict["RUS"]!
//print(myCountry)
//
//// Пустой словарь
//var emptyDictionary: [String:Int] = [:]
//
//var someDictionary = ["One":1, "Two":2, "Three":3]
//someDictionary.count
//var keys = countryDict.keys
//var values = countryDict.values
//
///// HomeWork
//
//typealias Chessman = [String: (alpha:Character, num:Int)?]
//
//var Chessmans: Chessman = ["Конь": ("B",4), "Слон": ("E",8), "Ферзь": nil]
//
//var figure = Array(Chessmans.keys).sorted()[2]
//
//if let valueConst = Chessmans[figure] {
//
//    if let alpha = valueConst?.alpha, let num = valueConst?.num {
//
//        print("Фигура \(figure) находится на позиции \(alpha):\(num)")
//
//    }else{print("Фигуры нет на доске")}
//
//} else {print("Ключ не найден")}

//////////////// LOOP //////////////////////////

var totalSum = 0
for i in (1...10).reversed() {
    
    totalSum += i
    
}
totalSum

//for i in stride(from:1, through:5, by:2) { print(i)}
//
//for i in stride(from:1, to:5, by:2) {print(i)}

//var countriesAndBlocks = ["Россия": "ЕАЭС", "США": "НАТО", "Франция":"ЕС"]
//
//for (countryName, blockName) in countriesAndBlocks {
//
//     print("\(countryName) вступила в \(blockName)")
//
//    }


var myMusicStyles = ["Rock", "Jazz", "Pop"]

//for (index, musicName) in myMusicStyles.enumerated() {
//    print("\(index+1). Я люблю \(musicName)")
//    }

//var result = 0
//repeat {
//
//    result += 1
//
//} while(result < 5)
//result
//
//import Foundation
//for i in 1...10 {
//
//    // Получить случайное число в указанном диапозоне
//    var randNum = Int(arc4random_uniform(10))
//    if randNum == 5 {
//        print("Итерация номер \(i)")
//        break
//    }
//}

// Прервать выполенеие внешнего цикла из внутреннего

//mainLoop: for i in 1...5 {
//
//    for y in i...5 {
//
//        if y == 4 && i == 2 {
//
//            break mainLoop
//        }
//        print("\(i) — \(y)")
//    }
//}

// HomeWork

//typealias Chessman = [String: (alpha:Character, num:Int)?]
//
//var Chessmans: Chessman = ["Конь": ("B",4), "Слон": ("E",8), "Ферзь": nil, "Арбуз": nil]
//
//for (key,value) in Chessmans {
//
//    if let valueConst = value {
//
//        print("Фигура \(key) находится на позиции \(valueConst.alpha):\(valueConst.num)")
//
//    } else {print("Фигура \(key) пала в бою!")}
//}


////////////// FUNC /////////////
//
//
//func sum(a:Int, b: Int, c:Int){
//
//    print("Сумма — \(a+b+c)")
//    }
//
//sum(a: 10, b: 51, c: 92)
//
//// Мы указали что имя параметра не отображать
//func sum(a:Int, _ b: Int, c:Int){
//
//    print("Сумма — \(a+b+c)")
//}
//
//sum(a: 10, 51, c: 92)
//
//// параметры являются константами и их нельзя менять
//func generateString(code: Int, _ text: String) -> String {
//    var mutableText = text
//    mutableText += String(code)
//    return mutableText
//    }
//generateString(code: 200, "Код:")
//
//// Изменить глобальные параметры внутри функции
//
//func changeValues(_ a: inout Int, _ b: inout Int) -> () {
//    let tmp = a
//    a=b
//    b = tmp
//    }
//var a = 150, b = 45
//changeValues(&a, &b)
//a
//b
//
//// Функция принимает неизвестное кол-во параметров 1ого типа
//func printRequestString(_ codes: Int...) {
//
//    var codesString = ""
//    for oneCode in codes {
//
//        codesString += String(oneCode) + " "
//
//    }
//    print("Получены ответы - \(codesString)")
//}
//
//printRequestString(600,100,200)
//
//
//
//// Возвращаем именованный кортеж!
//func getCodeDescription(code: Int) -> (code: Int, description: String){
//
//    let description: String
//    switch code {
//
//    case 1...100:
//        description = "Error"
//    case 101...200:
//        description = "Correct"
//    default:
//        description = "Unknown"
//    }
//    return (code, description)
//
//}
//
//let request = getCodeDescription(code: 45)
//request.description
//
//
//
//func sumWallet( wallet: [Int]? = nil ) -> Int? {
//
//    var sum = 0
//
//    if wallet == nil {return nil}
//
//    for oneBanknote in wallet! {
//
//            sum += oneBanknote
//        }
//        return sum
//}
//var wallet = [50, 100, 100, 500,1000, 5000,  50, 100]
//
//sumWallet(wallet: wallet)
//sumWallet()
//
//
//func generateWallet(walletLength: Int) -> [Int] {
//
//    // существующие типы банкнот
//    let typesOfBanknotes = [50, 100, 500, 1000, 5000]
//    // массив банкнот
//    var wallet: [Int] = []
//    // цикл генерации массива случайных банкнот
//    for _ in 1...walletLength {
//
//        // Верни случайное число не больше максимального индекса typesOfBanknotes.count
//
//        let randomIndex=Int(arc4random_uniform(UInt32(typesOfBanknotes.count-1)))
//
//        wallet.append(typesOfBanknotes[randomIndex] )
//    }
//    return wallet
//}
//
//
///// Передавать функцию в качестве аргумента!!! ///////
//
//func sumWallet(banknotsFunction wallet: (Int)->([Int]), walletCount: Int )-> Int? {
//
//    let myWalletArray = wallet(walletCount)
//    var sum: Int = 0
//
//    for oneBanknote in myWalletArray {
//
//        sum += oneBanknote
//
//    }
//    return sum
//}
//
//sumWallet(banknotsFunction: generateWallet, walletCount: 20)
//
//
//// Можно возвращать функцию! //////////
//
//// функция вывода текста
//func printText() -> (String) {
//    return "Очень хорошая книга"
//
//}
//
//func returnPrintTextFunction() -> () -> String {
//    return printText
//}
//
//
//
//let newFunctionInLet = returnPrintTextFunction()
//newFunctionInLet()
//
//
///// Вложеннные функции /////////////
//
//func oneStep(coordinates: inout (Int, Int), stepType: String ) {
//
//    func up(coords: inout (Int, Int)) {
//        coords = (coords.0 + 1, coords.1)
//    }
//    func right(coords: inout (Int, Int)) {
//        coords = (coords.0, coords.1 + 1)
//    }
//    func down(coords: inout (Int, Int)) {
//        coords = (coords.0 - 1, coords.1)
//    }
//    func left(coords: inout (Int, Int)) {
//        coords = (coords.0, coords.1 - 1)
//    }
//
//    switch stepType {
//
//        case "up": up(coords: &coordinates)
//        case "right": right(coords: &coordinates)
//        case "down": down(coords: &coordinates)
//        case "left": left(coords: &coordinates)
//        default:break
//    }
//}
//
//var coordinates = (10, -5)
//oneStep(coordinates: &coordinates, stepType: "up")
//oneStep(coordinates: &coordinates, stepType: "right")
//
//coordinates
//
//
//// Перегрузка функций ///
//
//func say(what: String){}
//func say(what: Int){}
//
//func cry() -> String {return "one"}
//func cry() -> Int {return 1}
//
////let resultOfFunc = say() // warning
//let resultString: String = cry()
//let resultInt: Int = cry()
//
//
//// безымянная функция в качестве значения константы
//let functionInLet = {return true}
//functionInLet()

/////////////////////////////// Замыкание //////////////////
//
//// функция отбора купюр
//func handle100(wallet: [Int]) -> [Int] {
//
//    var returnWallet = [Int]()
//
//    for banknot in wallet {
//        if banknot == 100 {
//            returnWallet.append(banknot)
//        }
//    }
//    print("Кол-во купюр по 100 \(returnWallet.count)шт.")
//    return returnWallet
//}
////var wallet = [10,50,100,100,5000,100,50,50,500,100]
////
////handle100(wallet: wallet)
//
//////////// /////////////////
//
//
//func compare100(banknot: Int) -> Bool {
//
//    return banknot == 100
//}
//
//func compare1000(banknot: Int) -> Bool {
//
//    return banknot >= 1000
//}
//
//func handle(wallet: [Int], closer: (Int) -> Bool) -> [Int] {
//
//    var returnWallet = [Int]()
//
//    for banknot in wallet {
//
//        if closer(banknot) {
//            returnWallet.append(banknot)
//        }
//    }
//
//    return returnWallet
//}
//
//var wallet = [10,50,100,100,5000,100,50,50,500,100]
//
//handle(wallet: wallet, closer: compare100)
//
//// Типо Лямбда функций!
//
//// отбор купюр достоинством выше 1000 рублей
////handle(wallet: wallet, closer: {(banknot: Int) -> Bool in return banknot>=1000})
////// отбор купюр достоинством 100 рублей
////handle(wallet: wallet, closer: {(banknot: Int) -> Bool in return banknot==100})
//
//
////handle(wallet: wallet, closer: {banknot in banknot>=1000})
////
////handle(wallet: wallet, closer: {banknot in  banknot==100})
//
//
////handle(wallet: wallet, closer: {$0>=1000})
////
////handle(wallet: wallet, closer: {$0==100})
//
//
////handle(wallet: wallet){$0>=1000}
////
////handle(wallet: wallet){$0==100}
//
//
////let successbanknots = [100, 500]
////let wallet100_500 = handle(wallet: wallet)
////{banknot in
////
////    for number in successbanknots {
////
////        if number == banknot {
////            return true
////        }
////    }
////    return false
////}
////print(wallet100_500)
//
//// задание в чем! задаю список банкнот и список банкнот по условию!
//
//func myFuncHandel(wallet: [Int],succsesbanknots:[Int]) -> [Int] {
//
//    var resultBunknots: [Int]  = []
//
//    for banknot in wallet {
//
//        if succsesbanknots.contains(banknot){
//            resultBunknots.append(banknot)
//        }
//    }
//    return resultBunknots
//}
////print(myFuncHandel(wallet: wallet, succsesbanknots: [10,50,100]))
//
//
//
//let successbanknots = [100, 500]
//let wallet100_500 = handle(wallet: wallet) {banknot in successbanknots.contains(banknot)}
//
////print(wallet100_500)
//
//
//// Сохранение замыкиня в переменную или константу!
//var sum: (_ numOne: Int, _ numTwo: Int) -> Int = {return $0 + $1}
//sum(10, 34)
//
//
/////// Сортировка ///////////////////
//
//
//var array = [1,44,81,4,277,50,101,51,8]
//
//array.sorted(by: {(first: Int, second: Int) -> Bool in return first < second})
//
////let sortedArray = array.sorted(by: {$0<$1})
////sortedArray
//
//var sortedArray = array.sorted(by: >)
//sortedArray
//
//////////////////////////////////// Каррирование!///////////////////
//
//func sum(x: Int, y: Int) -> Int {
//    return x + y
//    }
//sum(x: 1,y: 4) // вернет 5
//
//
//func sum2(_ x: Int) -> (Int) -> Int {
//
//    // Возвращает замыкание!
//    return
//        {return $0+x}
//
//    }
//var clouser_1 = sum2(1)
//
//clouser_1(10)
//
//
////////////// Захват переменных /////////////
//
////var a = 1
////var b = 2
////let closureSum : () -> Int = {return a+b}
////closureSum() // 3
////a = 3
////b = 4
////closureSum() // 7
//
////var a = 1
////var b = 2
////let closureSum : () -> Int = {[a,b] in return a+b}
////closureSum() // 3
////a = 3
////b = 4
////closureSum() // 3
//
//
//func makeIncrement(forIncrement amount: Int) -> () -> Int {
//
//    var runningTotal = 0
//
//    func increment() -> Int {
//        runningTotal += amount
//        return runningTotal
//    }
//    return increment
//}
//
//var incrementByTen = makeIncrement(forIncrement: 10)
//var incrementBySeven = makeIncrement(forIncrement: 7)
//incrementByTen()
//incrementByTen()
//
//
/////////////// Автозамыкания ///////////////
//
////var arrayOfNames = ["Helga", "Bazil", "Alex"]
////func printName(nextName: String ) {
////    // какой-либо код
////    print(nextName)
////    }
////printName(nextName: arrayOfNames.remove(at: 0))
//
//
//// Автозамыкание нужно чтобы вычеслить метод в определенный период времени! Когда нужно! а не сразу при передачи в аргументы
//var arrayOfNames = ["Helga", "Bazil", "Alex"]
//func printName(nextName: @autoclosure ()->String) {
//
//    // какой-либо код
//    print(nextName())
//
//}
//printName(nextName:arrayOfNames.remove(at: 0))
//
//
//
/////// Замыкания сохраняются в локальных переменных Но можно их вытащить в глобальную область видимости
//
//// Массив замыканий
//var arrayOfClosures: [()->Int] = []
//
//func addNewClosureInArray(_ newClosure: @escaping ()->Int){
//
//    arrayOfClosures.append(newClosure)
//    }
//
//addNewClosureInArray({return 100})
//addNewClosureInArray{return 1000}
//
//arrayOfClosures[0]() // 100
//arrayOfClosures[1]() // 1000



////////////////////////// Вспомогательные функциональные элементы //////////////


//var myArray = [2, 4, 5, 7]
//var newArray = myArray.map{$0 * 2}
//newArray // [2, 4, 5, 7]
//
//var intArray = [1, 2, 3, 4]
//var boolArray = intArray.map{$0 > 2}
//boolArray // [false, false, true, true]
//
//
//
//let numbers = [1, 2, 3, 4]
//let mapped = numbers.map {Array(repeating: $0, count: $0) }
//mapped
//
//
//var mappedCloseStars = ["Proxima Centauri": 4.24, "Alpha Centauri A": 4.37, "Alpha Centauri B": 4.37]
////let newCollection = mappedCloseStars.map{$0}
////newCollection
//
//
//let newCollection = mappedCloseStars.mapValues{ $0+1 }
//newCollection["Proxima Centauri"]
//
//
/////////////////////// Filter /////////////
//
//var starDistanceDict = ["Wolf 359": 7.78, "Alpha Centauri B": 4.37, "Proxima Centauri": 4.24, "AlphaCentauri A": 4.37,"Barnard's Star": 5.96]
//
//let closeStars = starDistanceDict.filter { $0.value < 5.0 }
//closeStars
//
//
//
//var filterArray = intArray.filter{$0 > 2}
//filterArray
//
/////////////////////////// Reduce /////////////
//
//let cash = [10, 50, 100, 500]
//let total = cash.reduce(210, +)
//
//
//let total_One = cash.reduce(210, {$0*$1})
//total_One
//let totalTwo = cash.reduce(210, {$0-$1})
//totalTwo
//
/////// Extendit двумерный массив /////
//
////let numbers = [1, 2, 3, 4]
//let flatMapped = numbers.flatMap { Array(repeating: $0, count: $0) }
//flatMapped // [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
//
//// отбор значений в многомерном массиве
//
let someArray = [[1, 2, 3, 4, 5], [11, 44, 1, 6], [16, 403, 321, 10]]
//
//let filterSomeArray = someArray.flatMap{$0.filter{ $0 % 2 == 0}}
//filterSomeArray // [2, 4, 44, 6, 16, 10]
//
//////////////////// Zip ///////////////
//
//let collectionOne = [1, 2, 3]
//let collectionTwo = [4, 5, 6]
//var zipSequence = zip(collectionOne,collectionTwo)
//print(Array(zipSequence))
//
//let newDictionary = Dictionary(uniqueKeysWithValues: zipSequence)
//print(newDictionary)

//let filterSomeArray = someArray.flatMap{$0}
//
//print(filterSomeArray)



/////////////////////////////////// LAZY Вычесления //////////////////////

var arrayOfNames = ["Helga", "Bazil", "Alex"]
//print(arrayOfNames.count)
// Замыкание в функции пока не обратимся вычесление над массивом не будет!
let nextName = { arrayOfNames.remove(at: 0) }

//print(arrayOfNames.count)
nextName()
//print(arrayOfNames.count)

// Lazy collection! Новый массив не преобразован пока не обратимся к переменной!
var myCollection = [1,2,3,4,5,6].lazy.map{$0 + 1}.filter{$0 % 2 == 0}
//print(Array(myCollection))

//////////////////////////////////////// ENUM ////////////////////////

//enum CurrencyUnit {
//
//    case rouble,dollar,euro
//
//}

//let roubleCurrency = CurrencyUnit.rouble
//
//let dollarCurrency: CurrencyUnit = .dollar
//dollarCurrency

/////////////// HomeWork////////

//enum Chessmans {
//
//    case king,knight,bishop,tower,quen
//}
//
//let kingChess = Chessmans.king
//
//enum CurrencyUnit {
//
//    case rouble(сountries: [String], shortName: String)
//    case dollar(сountries: [String], shortName: String)
//    case euro(сountries: [String], shortName: String)
//}
//
//var roubleCurrency = CurrencyUnit.rouble(сountries:["Russia"], shortName: "RUB")







//enum DollarCountries {
//
//    case usa
//    case canada
//    case australia
//
//}
//enum CurrencyUnit {
//
//    case rouble(сountries: [String], shortName: String)
//    case dollar(сountries: [String], shortName: String, national: DollarCountries)
//    case euro(сountries: [String], shortName: String)
//}
//
//
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
//
//let kingWight = Chessmans.king(name:"Король", color: .wight)
//kingWight


// Вложенные перечисления

enum CurrencyUnit {

    enum DollarCountries {

        case usa
        case canada
        case australia

    }

    case rouble(сountries: [String], shortName: String)
    case dollar(сountries: [String], shortName: String, national: DollarCountries)
    case euro(сountries: [String], shortName: String)
}
//
//
//var someVar = CurrencyUnit.DollarCountries.australia
//someVar


///////// Switch c ENUM ////////

//var someCurrency = CurrencyUnit.rouble(сountries: ["Russia","Ukraine", "Belarus"], shortName: "RUB")

var someCurrency = CurrencyUnit.euro(сountries: ["Germany,Itali,France"], shortName: "EUR")


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

//enum ArithmeticExpression {
//
//    // хранилище для операнда
//    case number(Int)
//    indirect case addition(ArithmeticExpression,ArithmeticExpression)
//
//    indirect case subtraction(ArithmeticExpression,ArithmeticExpression)
//
//    func evaluate(expression: ArithmeticExpression? = nil ) -> Int{
//
//        let expression = (expression == nil ? self : expression)
//
//        switch expression! {
//
//        case .number( let value ):
//            return value
//
//        case .addition(let valueLeft, let valueRight):
//            return self.evaluate( expression: valueLeft ) +
//                self.evaluate( expression: valueRight )
//
//        case .subtraction( let valueLeft, let valueRight ):
//            return self.evaluate( expression: valueLeft ) - self.evaluate(expression: valueRight )
//            }
//    }
//}

//////////////////////// STRUCT //////////////


//struct PlayerInChess {
//    var name: String
//    var wins: UInt
//
//}
//
//var oleg = PlayerInChess(name: "Олег", wins: 32)



//struct PlayerInChess {
//
//    var name = ""
//    var wins: UInt = 0
//}
//
//
//var oleg = PlayerInChess(name: "Олег", wins: 32)
//var maks = PlayerInChess()
//maks.name = "Maks"
//maks.name



struct PlayerInChess {
    
    var name: String
    var wins: UInt = 0
    
    init(name: String) {
        
        self.name = name
    }
}
var oleg = PlayerInChess(name: "Олег")
oleg.wins

// HomeWork/////

//enum ChessFigures: String {
//
//    case king = "Король"
//    case knight = "Конь"
//    case bishop = "Слон"
//    case tower = "Ладья"
//    case quen = "Ферзь"
//    case guarder = "Пешка"
//
//}
//
//enum Color: String {
//    case wight = "Белый"
//    case black = "Черный"
//}
//
//struct Chessmen {
//
//    var figure: ChessFigures
//    var colorFigure: Color
//    var coordinat: (String,UInt)?
//
//    init(figure: ChessFigures, colorFigure: Color) {
//
//        self.figure = figure
//        self.colorFigure = colorFigure
//    }
//
//}
//
//var towerWight = Chessmen(figure: ChessFigures.tower, colorFigure: Color.wight)
//towerWight.figure.rawValue



struct PlayerInChess_2 {
    var name: String
    var wins: UInt
    
    mutating func addWins(_ countWins: UInt) {
        
        self.wins += countWins
    }

}

var oleg_2 = PlayerInChess_2(name: "Олег", wins: 15)
oleg_2.wins
oleg_2.addWins(3)
oleg_2.wins




struct Chessmen {
    
    enum ChessFigures: String {
        
        case king = "Король"
        case knight = "Конь"
        case bishop = "Слон"
        case tower = "Ладья"
        case quen = "Ферзь"
        case guarder = "Пешка"
        
    }
    
    enum Color: String {
        case wight = "Белый"
        case black = "Черный"
    }

    var figure: ChessFigures
    var colorFigure: Color
    var coordinat: (String,UInt)?
    
    // Это инициализатор без координат
    init(figure: ChessFigures, colorFigure: Color) {

        self.figure = figure
        self.colorFigure = colorFigure
    }
    
    // Это инициализатор с координатами
    
    init(figure: ChessFigures, colorFigure: Color, coordinat: (String, UInt)) {
        
        self.figure = figure
        self.colorFigure = colorFigure
        self.coordinat = coordinat
    }
    
    
    mutating func setCooedinats (char: String, num: UInt) {
        
        self.coordinat = (char,num)
    }
    
    mutating func kill () {
        
        self.coordinat = nil
    }

}

var whiteBishop = Chessmen(figure: .bishop, colorFigure: .wight)
whiteBishop.setCooedinats(char: "A", num: 1)
whiteBishop.coordinat
whiteBishop.kill()
whiteBishop.coordinat




////////////////////// CLASS ////////////////////


//class Chessman {
//
//    let type: String
//    let color: String
//    let figureSymbol: Character
//
//    var coordinates: (String, Int)?
//
//    init(type: String, color: String, figure: Character){
//        self.type = type
//        self.color = color
//        self.figureSymbol = figure
//    }
//}
//
//var kingWhite = Chessman(type: "king", color: "white", figure: "♔")


class Chessman {
    
    enum ChessFigures: String {
        
        case king = "Король"
        case knight = "Конь"
        case bishop = "Слон"
        case tower = "Ладья"
        case quen = "Ферзь"
        case guarder = "Пешка"
        
    }
    
    enum Color: String {
        case wight = "Белый"
        case black = "Черный"
    }
    
    let type: ChessFigures
    let color: Color
    let figureSymbol: Character
    
    var coordinates: (String, Int)?
    
    init(type: ChessFigures, color: Color, figure: Character){
        self.type = type
        self.color = color
        self.figureSymbol = figure
    }
    
    init(type: ChessFigures, color: Color, figure: Character, coordinates: (String,Int)){
        self.type = type
        self.color = color
        self.figureSymbol = figure
        self.coordinates = coordinates
        // или self.setCoordinates(coordinates.0,coordinates.1)
    }
    
    func setCoordinates(char: String, num: Int) {
        """
        Метод устанавливает координаты
        """
        
        self.coordinates = (char,num)
    }
    
    func kill() {self.coordinates = nil}
}

var kingWhite = Chessman(type:.king, color: .wight, figure: "♔",coordinates:("E",1))
kingWhite.coordinates


//var dictTest = [Int:Bool]()
//var arrayTest = 1...10
////dictTest.forEach(<#T##body: ((key: Int, value: Int)) throws -> Void##((key: Int, value: Int)) throws -> Void#>)
////arrayTest.filter{$0%2 == 0 {
////
////    dictTest[$0] = true
////    }}
//print(arrayTest.filter{$0%2 == 0})
//
//print(arrayTest.forEach{$0
//
//    if $0%2 == 0 {
//        dictTest[$0] = true
//    }
//})
//
//let sordDict = dictTest.sorted{ $0.0 < $1.0}
//print(sordDict)
//dictTest.forEach{$0.0
//
//    dictTest[$0.0] = false
//}
//
//
//var newDict = [2:4, 4:2, 6:36]
//
//newDict.forEach{first,second in
//
//    print(first)
//
//}
//var sortNewDict = newDict.mapValues{$0 / 2}.sorted{$0.1 < $1.1}
//print(sortNewDict)



var testString = " aaaa, bbbb "
testString.replacingOccurrences(of: " ", with: "").split(separator: ",")

var testString2 = "  asdasd asdasd "

if testString2.first == " " {
    testString2.removeFirst()
    
} else if testString2.last == " " {
        testString2.removeLast()
    }

testString2


let source = "how now brown cow"
var frequencies: [Character: Int] = [:]

for c in source {
    frequencies[c, default: 0] += 1
}
frequencies

let contacts = ["Julia", "Susan", "John", "Alice", "Alex"]
let grouped = Dictionary(grouping: contacts, by: { $0.first! })
grouped

var numbers = [1,2,3,4,5]
numbers.swapAt(0,1)

////////////////////// Propertes ///////////

/////////////////// Работа с экземплярами типа /////////

struct Circel {
    
    var coordinates: (x: Int, y: Int)
    var radius: Float
    // Вычеслаемые properties с помощью замыканий
    var perimetr: Float {
        
        get {
            return 3.14 * 2.0 * self.radius
        }
        
        set(newValue) {
            
            self.radius = newValue / (3.14 * 2.0)
        }
        
    }
}

var circleTest = Circel(coordinates: (0,0), radius: 10)
circleTest.perimetr
circleTest.perimetr = 31.4
circleTest.radius


/////// Observer Наблюдатели ///////////


struct Circel_2 {
    
    var coordinates: (x: Int, y: Int)
    var radius: Float {
        
        // Это мы делаем перед установкой
        willSet(newValue) {
            
            print("Вместо старого значения \(self.radius) установим \(newValue)")
        }
        
        // Это мы делаем сразу после назначения нового значение
        didSet(oldValue) {
            
            print("Вместо старого значения \(oldValue) установим \(self.radius)")
        }
        
        
    }
    // Вычеслаемые properties с помощью замыканий
    var perimetr: Float {
        
        get {
            return 3.14 * 2.0 * self.radius
        }
        
        set(newValue) {
            
            self.radius = newValue / (3.14 * 2.0)
        }
        
    }
}

//var circel_Test_2 = Circel_2(coordinates: (x:0,y:0), radius: 15.0)
//circel_Test_2.radius = 10


///////////// Свойства типа ///////////

//struct SomeStructure {
//
//    static var storedTypeProperty = "Some value"
//    static var computedTypeProperty: Int {
//        return 1 }
//}
//
//SomeStructure.storedTypeProperty
//
//class SomeClass{
//    static var storedTypeProperty = "Some value."
//
//    static var computedTypeProperty: Int {
//        return 3
//    }
//
//    // Это свойвство нужно чтобы его мог использовать подкласс
//    class var overrideableComputedTypeProperty: Int {
//        return 4
//    }
//}
//
//
//struct AudioChannel {
//
//    // type stored property
//    static var maxVolume = 5
//
//    //Storedproperty - хранит какое то значение
//    var volume: Int {
//
//        didSet {
//            if volume > AudioChannel.maxVolume {
//                volume = AudioChannel.maxVolume
//                }
//        }
//    }
//}
//
//var LeftChannel = AudioChannel(volume: 2)
//
//var RightChannel = AudioChannel(volume: 3)
//
//RightChannel.volume = 6
//RightChannel.volume
//
//AudioChannel.maxVolume = 10
//RightChannel.volume = 6
//RightChannel.volume

/////////////////////// Subscripts  for Struct and Class //////////////

//class GameDesk {
//
//    var desk: [Int:[String:Chessman]] = [:]
//
//    init(){
//        for i in 1...8 {
//            desk[i] = [:]
//        }
//    }
//
//    subscript(alpha: String, number: Int) -> Chessman? {
//
//        get {
//                // Если не nil то вернем значение или дефолт
//                return self.desk[number]![alpha] ?? nil
//        }
//        set {
//
//            if let constValue = newValue {
//
//                self.setChessman(chess: newValue!, coordinates:(alpha, number))
//            } else {
//
//                // nil
//            }
//
//        }
//
//    }
//
//    func setChessman(chess:Chessman, coordinates:(String,Int)) {
//
//        self.desk[coordinates.1]![coordinates.0] = chess
//        chess.setCoordinates(char: coordinates.0, num: coordinates.1)
//
//     }
//}
//
//
//var game = GameDesk()
//var QueenBlack = Chessman(type: .quen, color: .black, figure:
//    "♛", coordinates: ("A", 6))
//
//game.setChessman(chess: QueenBlack, coordinates: ("A",3))
//game["C",5] = QueenBlack
//QueenBlack.coordinates




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

