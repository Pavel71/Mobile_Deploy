import UIKit

//////////// FUNC /////////////


func sum(a:Int, b: Int, c:Int){
    
    print("Сумма — \(a+b+c)")
}

sum(a: 10, b: 51, c: 92)

// Мы указали что имя параметра не отображать
func sum(a:Int, _ b: Int, c:Int){
    
    print("Сумма — \(a+b+c)")
}

sum(a: 10, 51, c: 92)

// параметры являются константами и их нельзя менять
func generateString(code: Int, _ text: String) -> String {
    var mutableText = text
    mutableText += String(code)
    return mutableText
}
generateString(code: 200, "Код:")

// Изменить глобальные параметры внутри функции

func changeValues(_ a: inout Int, _ b: inout Int) -> () {
    let tmp = a
    a=b
    b = tmp
}
var a = 150, b = 45
changeValues(&a, &b)
a
b

// Функция принимает неизвестное кол-во параметров 1ого типа
func printRequestString(_ codes: Int...) {
    
    var codesString = ""
    for oneCode in codes {
        
        codesString += String(oneCode) + " "
        
    }
    print("Получены ответы - \(codesString)")
}

printRequestString(600,100,200)



// Возвращаем именованный кортеж!
func getCodeDescription(code: Int) -> (code: Int, description: String){
    
    let description: String
    switch code {
        
    case 1...100:
        description = "Error"
    case 101...200:
        description = "Correct"
    default:
        description = "Unknown"
    }
    return (code, description)
    
}

let request = getCodeDescription(code: 45)
request.description



func sumWallet( wallet: [Int]? = nil ) -> Int? {
    
    var sum = 0
    
    if wallet == nil {return nil}
    
    for oneBanknote in wallet! {
        
        sum += oneBanknote
    }
    return sum
}
var wallet = [50, 100, 100, 500,1000, 5000,  50, 100]

sumWallet(wallet: wallet)
sumWallet()


func generateWallet(walletLength: Int) -> [Int] {
    
    // существующие типы банкнот
    let typesOfBanknotes = [50, 100, 500, 1000, 5000]
    // массив банкнот
    var wallet: [Int] = []
    // цикл генерации массива случайных банкнот
    for _ in 1...walletLength {
        
        // Верни случайное число не больше максимального индекса typesOfBanknotes.count
        
        let randomIndex=Int(arc4random_uniform(UInt32(typesOfBanknotes.count-1)))
        
        wallet.append(typesOfBanknotes[randomIndex] )
    }
    return wallet
}


/// Передавать функцию в качестве аргумента!!! ///////

func sumWallet(banknotsFunction wallet: (Int)->([Int]), walletCount: Int )-> Int? {
    
    let myWalletArray = wallet(walletCount)
    var sum: Int = 0
    
    for oneBanknote in myWalletArray {
        
        sum += oneBanknote
        
    }
    return sum
}

sumWallet(banknotsFunction: generateWallet, walletCount: 20)


// Можно возвращать функцию! //////////

// функция вывода текста
func printText() -> (String) {
    return "Очень хорошая книга"
    
}

func returnPrintTextFunction() -> () -> String {
    return printText
}



let newFunctionInLet = returnPrintTextFunction()
newFunctionInLet()


/// Вложеннные функции /////////////

func oneStep(coordinates: inout (Int, Int), stepType: String ) {
    
    func up(coords: inout (Int, Int)) {
        coords = (coords.0 + 1, coords.1)
    }
    func right(coords: inout (Int, Int)) {
        coords = (coords.0, coords.1 + 1)
    }
    func down(coords: inout (Int, Int)) {
        coords = (coords.0 - 1, coords.1)
    }
    func left(coords: inout (Int, Int)) {
        coords = (coords.0, coords.1 - 1)
    }
    
    switch stepType {
        
    case "up": up(coords: &coordinates)
    case "right": right(coords: &coordinates)
    case "down": down(coords: &coordinates)
    case "left": left(coords: &coordinates)
    default:break
    }
}

var coordinates = (10, -5)
oneStep(coordinates: &coordinates, stepType: "up")
oneStep(coordinates: &coordinates, stepType: "right")

coordinates


// Перегрузка функций ///

func say(what: String){}
func say(what: Int){}

func cry() -> String {return "one"}
func cry() -> Int {return 1}

//let resultOfFunc = say() // warning
let resultString: String = cry()
let resultInt: Int = cry()


// безымянная функция в качестве значения константы
let functionInLet = {return true}
functionInLet()
