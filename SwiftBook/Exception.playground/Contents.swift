import UIKit

// Ошибки прописываются вручную через перечисление
enum VendingMachineError: Error {
    
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

/////// throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {

    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
        ]
    
    var coinsDeposited = 0
    
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
        }
    
    func vend(itemNamed name: String) throws {
        
        guard var item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {

            throw VendingMachineError.InsufficientFunds(coinsNeeded:
                item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        dispenseSnack(snack: name)
    }
}

let favoriteSnacks = ["Alice": "Chips", "Bob": "Licorice", "Eve": "Pretzels"]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do {
    // Пробуем эту функцию! Если есть ошибка то ловим ее
    try buyFavoriteSnack(person: "Alice", vendingMachine:vendingMachine)
    
    } catch VendingMachineError.InvalidSelection {
        print("Invalid Selection.")
        
    } catch VendingMachineError.OutOfStock {
            print("Out of Stock.")
        
    } catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
            
            print("Недостаточно средств.Внесите еще \(coinsNeeded) монет(ы).")
        }

////////   Преобразование ошибки в nil /////////

//func someThrowingFunction() throws -> Int {
//    // ...
//    }
//let x = try? someThrowingFunction()

//////////////// Запретить выброс ошибок /////////

// бессмысленное дерьио
//let photo = try! loadImage("./Resources/John Appleseed.jpg")


////////////// Отложенный блок кода! Например закрытие файла!
// В Python это делал контекст менеджер

//func processFile(filename: String) throws {
//    
//    if exists(filename) {
//        let file = open(filename)
//
//        defer {
//            close(file)
//        }
//        while let line = try file.readline() {
//
//            // работа с файлом!
//        }
//    }
//
//}

