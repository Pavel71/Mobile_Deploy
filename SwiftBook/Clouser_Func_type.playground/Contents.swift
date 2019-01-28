import UIKit

///////////////////////////// Замыкание //////////////////

// функция отбора купюр
func handle100(wallet: [Int]) -> [Int] {
    
    var returnWallet = [Int]()
    
    for banknot in wallet {
        if banknot == 100 {
            returnWallet.append(banknot)
        }
    }
    print("Кол-во купюр по 100 \(returnWallet.count)шт.")
    return returnWallet
}
//var wallet = [10,50,100,100,5000,100,50,50,500,100]
//
//handle100(wallet: wallet)

////////// /////////////////


func compare100(banknot: Int) -> Bool {
    
    return banknot == 100
}

func compare1000(banknot: Int) -> Bool {
    
    return banknot >= 1000
}

func handle(wallet: [Int], closer: (Int) -> Bool) -> [Int] {
    
    var returnWallet = [Int]()
    
    for banknot in wallet {
        
        if closer(banknot) {
            returnWallet.append(banknot)
        }
    }
    
    return returnWallet
}

var wallet = [10,50,100,100,5000,100,50,50,500,100]

handle(wallet: wallet, closer: compare100)

// Типо Лямбда функций!

// отбор купюр достоинством выше 1000 рублей
//handle(wallet: wallet, closer: {(banknot: Int) -> Bool in return banknot>=1000})
//// отбор купюр достоинством 100 рублей
//handle(wallet: wallet, closer: {(banknot: Int) -> Bool in return banknot==100})


//handle(wallet: wallet, closer: {banknot in banknot>=1000})
//
//handle(wallet: wallet, closer: {banknot in  banknot==100})


//handle(wallet: wallet, closer: {$0>=1000})
//
//handle(wallet: wallet, closer: {$0==100})


//handle(wallet: wallet){$0>=1000}
//
//handle(wallet: wallet){$0==100}


//let successbanknots = [100, 500]
//let wallet100_500 = handle(wallet: wallet)
//{banknot in
//
//    for number in successbanknots {
//
//        if number == banknot {
//            return true
//        }
//    }
//    return false
//}
//print(wallet100_500)

// задание в чем! задаю список банкнот и список банкнот по условию!

func myFuncHandel(wallet: [Int],succsesbanknots:[Int]) -> [Int] {
    
    var resultBunknots: [Int]  = []
    
    for banknot in wallet {
        
        if succsesbanknots.contains(banknot){
            resultBunknots.append(banknot)
        }
    }
    return resultBunknots
}
//print(myFuncHandel(wallet: wallet, succsesbanknots: [10,50,100]))



let successbanknots = [100, 500]
let wallet100_500 = handle(wallet: wallet) {banknot in successbanknots.contains(banknot)}

//print(wallet100_500)


// Сохранение замыкиня в переменную или константу!
var sum: (_ numOne: Int, _ numTwo: Int) -> Int = {return $0 + $1}
sum(10, 34)


///// Сортировка ///////////////////


var array = [1,44,81,4,277,50,101,51,8]

array.sorted(by: {(first: Int, second: Int) -> Bool in return first < second})

//let sortedArray = array.sorted(by: {$0<$1})
//sortedArray

var sortedArray = array.sorted(by: >)
sortedArray

////////////////////////////////// Каррирование!///////////////////

func sum(x: Int, y: Int) -> Int {
    return x + y
}
sum(x: 1,y: 4) // вернет 5


func sum2(_ x: Int) -> (Int) -> Int {
    
    // Возвращает замыкание!
    return
        {return $0+x}
    
}
var clouser_1 = sum2(1)

clouser_1(10)


//////////// Захват переменных /////////////

//var a = 1
//var b = 2
//let closureSum : () -> Int = {return a+b}
//closureSum() // 3
//a = 3
//b = 4
//closureSum() // 7

//var a = 1
//var b = 2
//let closureSum : () -> Int = {[a,b] in return a+b}
//closureSum() // 3
//a = 3
//b = 4
//closureSum() // 3


func makeIncrement(forIncrement amount: Int) -> () -> Int {
    
    var runningTotal = 0
    
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}

var incrementByTen = makeIncrement(forIncrement: 10)
var incrementBySeven = makeIncrement(forIncrement: 7)
incrementByTen()
incrementByTen()


///////////// Автозамыкания ///////////////

//var arrayOfNames = ["Helga", "Bazil", "Alex"]
//func printName(nextName: String ) {
//    // какой-либо код
//    print(nextName)
//    }
//printName(nextName: arrayOfNames.remove(at: 0))


// Автозамыкание нужно чтобы вычеслить метод в определенный период времени! Когда нужно! а не сразу при передачи в аргументы
var arrayOfNames = ["Helga", "Bazil", "Alex"]
func printName(nextName: @autoclosure ()->String) {
    
    // какой-либо код
    print(nextName())
    
}
printName(nextName:arrayOfNames.remove(at: 0))



///// Замыкания сохраняются в локальных переменных Но можно их вытащить в глобальную область видимости

// Массив замыканий
var arrayOfClosures: [()->Int] = []

func addNewClosureInArray(_ newClosure: @escaping ()->Int){
    
    arrayOfClosures.append(newClosure)
}

addNewClosureInArray({return 100})
addNewClosureInArray{return 1000}

arrayOfClosures[0]() // 100
arrayOfClosures[1]() // 1000

