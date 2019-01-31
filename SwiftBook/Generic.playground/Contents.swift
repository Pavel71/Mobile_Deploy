import UIKit

//func swapTwoInts( a: inout Int, b: inout Int) {
//
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//var first = 120
//var second = 200
//
//swapTwoInts(a: &first, b: &second)
//first
//second

////// Generic //////

func swapTwoInts <T> ( a: inout T, b: inout T) {
    
    let temporaryA = a
    a = b
    b = temporaryA
}

var first = "120"
var second = "200"

swapTwoInts(a: &first, b: &second)
first
second

//// create Stack ////

struct Stack <T>{
    
    var items: [T] = []
    
    // Пустой инициализатор для объявления экземпляра
    init(){}
    // Это инициализатор с добавлениме значений
    init(_ elements: T...) {
        
        self.items = elements
    }
    
    mutating func push(_ item: T) {
        
        self.items.append(item)
    }
    
    mutating func pop () -> T {
        
        return self.items.removeLast()
    
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
let fromTheTop = stackOfStrings.pop()

var stackInt = Stack(1,2,3,4,5)
stackInt


/// Тут суть в том что должен быть тип поддерживающий протокл Equatable! В пример Int поддерживает Equatable!
func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
    
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
            }
    }
    return nil
}

var myArray = [3.14159, 0.1, 0.25]
let firstIndex = findIndex(array: myArray, valueToFind: 0.1)
let secondIndex = findIndex(array: myArray, valueToFind: 31)

// Extension Stack

extension Stack {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

var exStack = Stack(1,2,3)

exStack.topItem
exStack.items

//// Linked Type ///

protocol Container {
    
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct StackContainer<T>: Container {
    typealias ItemType = T
    
    var items = [T]()
    
    var count: Int {
        return items.count
    }
    init(){}
    init(_ elements: T...){
        items = elements
    }
    subscript(i: Int) -> T {
        return items[i]
    }
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    mutating func append(item: T) {
        items.append(item)
    
    }
}

    
