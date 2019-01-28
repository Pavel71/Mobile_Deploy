import UIKit

///// Array///////

let lineArray = Array(0...9)

let repeatArray = Array(repeating: "Swift", count: 5)

var mutableArray = [2, 4, 8]

mutableArray[1] = 16
mutableArray

mutableArray[0...1] = [25]
mutableArray

// получить пустые массивы
var emptyArray: [String] = []
var anotherEmptyArray = [String]()

var alphaArray = [String?](repeating: nil, count: 5)

var arrayOfArrays = [[1,2,3], [4,5,6], [7,8,9]]
arrayOfArrays[0][0]


var someArray = [1, 2, 3, 4, 5]
someArray.count
someArray.isEmpty
someArray.suffix(3)
someArray.append(6)
someArray.insert(100, at: 2)
someArray.remove(at: 2)
someArray.removeFirst()
someArray.removeLast()

let someArray_const = [1, 2, 3, 4, 5]
someArray_const.dropLast()
someArray_const.dropFirst(3)
someArray_const

var intArray = [1, 2, 3, 4, 5, 6]
intArray.contains(4)

intArray.index(of:4)
intArray.index(of:99)
intArray.min()
intArray.max()
intArray.reverse()
intArray

////////////////////////////// SET //////////////////

var dishes: Set<String> = ["хлеб", "овощи","тушенка", "вода"]
var dishesTwo: Set = ["хлеб", "овощи","тушенка", "вода"]
var members = Set(arrayLiteral: "Энекин", "Оби Ван", "Йода")

//var musicStyleSet: Set<String> = []
//musicStyleSet.insert("Jazz")

var musicStyleSet: Set<String> = ["Jazz", "Hip-Hop", "Rock"]
musicStyleSet.remove("Hip-Hop")
musicStyleSet.remove("Classic")
musicStyleSet.removeAll()
musicStyleSet.contains("Funk")

let evenDigits: Set = [0, 2, 4, 6, 8]
let oddDigits: Set = [1, 3, 5, 7, 9]
var differentDigits: Set = [3, 4, 7, 8]

// Найти общие элементы!
var inter = differentDigits.intersection(oddDigits).sorted()

// Все непересикающиеся
var exclusive = Set(differentDigits.symmetricDifference(oddDigits).sorted())

var union = evenDigits.union(oddDigits).sorted()

// Все что не входит!
var subtract = differentDigits.subtracting(evenDigits).sorted()


var aSet: Set = [1, 2, 3, 4, 5]
var bSet: Set = [1, 3]

if bSet.isSubset(of: aSet) {print("bSet — это субнабор для aSet")}
aSet.isSuperset(of: bSet)


var cSet: Set = [6, 7, 8, 9]
if bSet.isDisjoint(with: cSet) {print("наборы bSet и cSet не пересекаются")}


if bSet.isStrictSubset(of: aSet) {
    print("bSet — субнабор для aSet") }
if aSet.isStrictSuperset(of: bSet) {
    print("aSet — супернабор для bSet") }

/////////////////// DICT //////////////////////

let baseCollection = [(2, 5), (3, 6), (1, 4)]
let newDictionary = Dictionary(uniqueKeysWithValues: baseCollection)


let nearestStarNames = ["Proxima Centauri", "Alpha Centauri A", "Alpha Centauri B", "Barnard's Star", "Wolf 359"]
let nearestStarDistances = [4.24, 4.37, 4.37, 5.96, 7.78]

let starDistanceDict = Dictionary(uniqueKeysWithValues:zip(nearestStarNames, nearestStarDistances))

var countryDict = ["RUS":"Россия", "BEL": "Беларусь", "UKR":"Украина"]
countryDict["RUS"] = "Российская Федерация"

countryDict.updateValue("Российская Федерация", forKey: "RUS")
countryDict["TUR"] = "Турция"

// Удаление!
countryDict["UKR"] = nil
countryDict.removeValue(forKey: "BEL")
countryDict

let myCountry: String = countryDict["RUS"]!
print(myCountry)

// Пустой словарь
var emptyDictionary: [String:Int] = [:]

var someDictionary = ["One":1, "Two":2, "Three":3]
someDictionary.count
var keys = countryDict.keys
var values = countryDict.values

/// HomeWork

typealias Chessman = [String: (alpha:Character, num:Int)?]

var chessmans: Chessman = ["Конь": ("B",4), "Слон": ("E",8), "Ферзь": nil]


//var needDict = chessmans.filter{$0.value != nil}
//needDict

chessmans.forEach{if let val = $0.value{
    
    print("\($0.key) находится на позиции \(val.alpha)_\(val.num)")
    
} else {print("\($0.key) нету на доске")}
    
}




var figure = Array(chessmans.keys).sorted()[2]

if let valueConst = chessmans[figure] {
    
    if let alpha = valueConst?.alpha, let num = valueConst?.num {
        
        print("Фигура \(figure) находится на позиции \(alpha):\(num)")
        
    }else{print("Фигуры нет на доске")}
    
} else {print("Ключ не найден")}

