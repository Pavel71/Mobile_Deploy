import UIKit

////////////////////////// Вспомогательные функциональные элементы //////////////


var myArray = [2, 4, 5, 7]
var newArray = myArray.map{$0 * 2}
newArray // [2, 4, 5, 7]

var intArray = [1, 2, 3, 4]
var boolArray = intArray.map{$0 > 2}
boolArray // [false, false, true, true]



let numbers = [1, 2, 3, 4]
let mapped = numbers.map {Array(repeating: $0, count: $0) }
mapped


var mappedCloseStars = ["Proxima Centauri": 4.24, "Alpha Centauri A": 4.37, "Alpha Centauri B": 4.37]
//let newCollection = mappedCloseStars.map{$0}
//newCollection


let newCollection = mappedCloseStars.mapValues{ $0+1 }
newCollection["Proxima Centauri"]


///////////////////// Filter /////////////

var starDistanceDict = ["Wolf 359": 7.78, "Alpha Centauri B": 4.37, "Proxima Centauri": 4.24, "AlphaCentauri A": 4.37,"Barnard's Star": 5.96]

let closeStars = starDistanceDict.filter { $0.value < 5.0 }
closeStars



var filterArray = intArray.filter{$0 > 2}
filterArray

///////////////////////// Reduce /////////////

let cash = [10, 50, 100, 500]
let total = cash.reduce(210, +)


let total_One = cash.reduce(210, {$0*$1})
total_One
let totalTwo = cash.reduce(210, {$0-$1})
totalTwo

///// Extendit двумерный массив /////

//let numbers = [1, 2, 3, 4]
let flatMapped = numbers.flatMap { Array(repeating: $0, count: $0) }
flatMapped // [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]

// отбор значений в многомерном массиве

let someArray = [[1, 2, 3, 4, 5], [11, 44, 1, 6], [16, 403, 321, 10]]

let filterSomeArray = someArray.flatMap{$0.filter{ $0 % 2 == 0}}
filterSomeArray // [2, 4, 44, 6, 16, 10]

////////////////// Zip ///////////////

let collectionOne = [1, 2, 3]
let collectionTwo = [4, 5, 6]
var zipSequence = zip(collectionOne,collectionTwo)
print(Array(zipSequence))

let newDictionary = Dictionary(uniqueKeysWithValues: zipSequence)
print(newDictionary)



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
print(Array(myCollection))

