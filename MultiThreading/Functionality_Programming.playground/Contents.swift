import Cocoa

var str = "Functionality programming"

var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


// 1. Можно расширить класс и делать то что нужно по вызову функции

// Преимущества

// 1. Потокобезопасный - Так как возвращает новый массив и результат зависит только от входа
// 2. Метод говорит сам за себя
// 3. Сохраняется первоначальный массив
// 4. Легкое тестирование

extension Array where Element == Int {
  
  func timesTen() -> [Int] {
    
    var output = [Int]()
    for num in self {
      output.append(num * 10)
    }
    return output
  }
  
  // Вот как выглядит функция map
  func map <T> (_ transform: (Element) -> T) ->  [T] {
    
    var returnValue = [T]()
    for item in self {
      returnValue.append(transform(item))
    }
    return returnValue
  }
}

var numbersTen = numbers.timesTen()

///  MAP

let resultMap = numbers.map { $0 * 10 }



let possibleNumbers = ["1", "2", "three", "///4///", "5"]
let mapped = possibleNumbers.map {str in Int(str) }
// print (mapped) // [Optional(1), nil ]
// Функция очищает все nil
let compactMapped = possibleNumbers.compactMap(Int.init)
// print (compactMapped) // [1, 2, 5]

// Validate URLs
let strings = ["https://demo0989623.mockable.io/car/1",
               "https://i.imgur.com/Wm1xcNZ.jpg"]
let validateURLs = strings.compactMap(URL.init)
//print(validateURLs) // URL


// Separate Numbers and Operations
let mathString: String = "12-37*2/5+44"
let numbers1 = mathString.components(separatedBy: ["-", "*", "+", "/"]).compactMap(Int.init)
//print(numbers1) // [12, 37, 2, 5, 44]


// zip объеденяет 2 массива

let wordes = ["one", "two", "three", "four"]
let numbersRange = 1...5
// Объеденили и можем бежать по 2м массивам даже если они разного размера
for (word, number) in zip(wordes, numbersRange) {
//  print("\(word): \(number)")
}

let text = "Buffalo buffalo buffalo buffalo."
let firstWord = text.prefix(while: { $0 != " " })
//print(firstWord)

/// Filter
// sequence - берет предыдущие значения и создает последовательность
// first - Это мы задаем старт последовательности
// next это преобразования в этой последовательности
// а дальше навешиваем функции

let fibonacci = sequence(first: (0, 1), next: { ($1, $0 + $1) })
  .prefix(20).map{$0.0}
  .filter {$0 % 2 == 0 && $0 < 4000}
//print (fibonacci)

// взять все десятки
let numbersFactor = sequence(first:1, next: {  $0 * 10 })
  .prefix(5).map{$0}

// Factorial
let numbersFact = sequence(first: (1,1), next: { ($0 + 1, $1 * $0 ) })
  .prefix(5).map{$0}

//print(numbersFact)

func factor(numb: Int) -> Int {
  var result = 1
  for n in 1...numb {
    result = result * n

  }
  return result
}

factor(numb: 5)

/// Задачка на исключение значений из массива по индексу
var images = [6, 22, 8, 14, 16, 0, 7, 9]
var removedIndexes = [2,5,0,6]
var images1 = images
  .enumerated()
  .filter { !removedIndexes.contains($0.offset) } // offset index 0 1 2 3
  .map { $0.element } // element значение

//print (images1) // [22, 14, 16, 9]

/// Reduce

let sum = [5,3].reduce(0, +) // 0 начало + первый элемент в 0 будет скапливатся первый элемент
let summ = [5,3,7].reduce(0, { x, y in

  return x + y
})

// Так можно определить размер перелистывание вправа scrolViews

//let scrollView = UIScrollView()
//scrollView.addSubview(UIView(frame: CGRect(x: 300.0, y: 0.0, width: 200, height: 300)))
//scrollView.addSubview(UIView(frame: CGRect(x: 100.0, y: 0.0, width: 300, height: 600)))
//
//scrollView.contentSize = scrollView.subviews
//  .reduce(CGRect.zero,{$0.union($1.frame)})
//  .size

// Разобрать кортеж значений
// Separate Tuples
let arr = [("one", 1), ("two", 2), ("three", 3), ("four", 4)]
let (arr1, arr2) = arr.reduce(([], [])) {
  ($0.0 + [$1.0], $0.1 + [$1.1]) }

//print(arr1) // ["one", "two", "three", "four"]
//print(arr2) // [1, 2, 3, 4]

// Remove duplicates
let arrayInt = [1,1,2,6,6,7,2,9,7].reduce(into: []) { //$0 это пустой массив
  $0.contains($1) ? () : $0.append($1) }
arrayInt // [1, 2, 6, 7, 9]

let arrayIntCount = [1,1,2,2,6,6,7,2,9,7].reduce(into: [:]) {
  dict, number in  dict[number, default: 0] += 1  }

arrayIntCount // [6: 2, 9: 1, 1: 2, 2: 3, 7: 2]



////////////// FLATMAP //////////

let multilineString = """
Есть свойства, бестелесные явленья,
С двойною жизнью; тип их с давних лет, —
Та двойственность, что поражает зренье:
То — тень и сущность, вещество и свет.

Есть два молчанья, берега и море,
Душа и тело. Властвует одно
В тиши. Спокойно нежное, оно
Воспоминаний и познанья горе

Таит в себе, и «больше никогда»
Зовут его. Телесное молчанье,
Оно бессильно, не страшись вреда!
"""

//let words = multilineString.lowercased()
//  .split(separator: "\n")
//  .map{$0.split(separator: " ")}



let words = multilineString.lowercased()
  .split(separator: "\n")
  .flatMap{$0.split(separator: " ")}
//print(words)


// Применяем на задачке
// Собрать все в 1 строку очистив от хлама!

let wordsString = words.reduce ("",+).filter {
  "абвгдеёжзийклмнопрстуфхцчшщьыъэюя".contains($0)}
//print(wordsString)

let countsLeter = wordsString.reduce(into: [:]) {
  dict, letter in
  dict[letter, default: 0] += 1
}
countsLeter

// Можно также еще

let letterCountDictionary = Dictionary(grouping: wordsString ){$0}.mapValues {$0.count
}
//print(letterCountDictionary)

// Сортировка + положить все в массив
let lettersStat = letterCountDictionary
  .sorted(by: <)
  .map{"\($0.0):\($0.1)"}
//print (lettersStat)

let countsStat = letterCountDictionary
  .sorted(by: {$0.value > $1.value})
  .map{"\($0.0):\($0.1)"}
//print (countsStat )

// Ставлю себе задачу разобрать это обратно в Словарь

//print(lettersStat)

var dictionary: [String:String] = [:]

var dictCountLetter: [String:String] = lettersStat.reduce(into:[:]){
  dict,string in
  var array = string.split(separator: ":")
  dict[String(array[0])] = String(array[1])
}
//print(dictCountLetter)

// Можно и так
var (key,value) =  lettersStat.reduce(([],[])) {
  ($0.0 + [$1.split(separator:":")[0]], $0.1 + [$1.split(separator:":")[1]])
}


/// First where

let numbers2 = [3, 7, 4, -2, 9, -6, 10, 1]
let firstNegative = numbers2.first(where: { $0 < 0 })
