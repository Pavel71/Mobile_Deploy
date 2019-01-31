import UIKit

//////////// Delete ARc ///////



class myClass{
    
    var description: String
    
    init(description: String){
        print("Экземпляр \(description) создан")
        self.description = description
    }
    
    deinit{
        
        print("Экземпляр \(self.description) уничтожен")
    }
}
//
//var myVar1 = myClass(description: "ОДИН")
//
//if true {
//
//    var myVar2 = myClass(description: "ДВА")
//
//}


//var myVar1 = myClass(description: "ОДИН")
//var myVar2 = myVar1
//
//
//myVar1 = myClass(description: "ДВА")
//myVar2 = myVar1



//////////// Утечка памяти! Есть множство ссылок друг на друга в локальной области видимости

//class Human {
//    let name: String
//    var child = [Human?]()
//    var father: Human?
//    var mother: Human?
//
//
//
//    init(name: String){
//        self.name = name
//    }
//    deinit {
//        print(self.name + "   - delete ")
//    }
//}
//
//if 1==1 {
//
//    var Kirill = Human(name: "Кирилл")
//    var Olga = Human(name: "Ольга")
//    var Aleks = Human(name: "Алексей")
//    Kirill.father = Aleks
//    Kirill.mother = Olga
//    Aleks.child.append(Kirill)
//    Olga.child.append(Kirill)
//}


/// weak не работает я хз
//class Human {
//    let name: String
//    var child = [Human?]()
//    weak var father: Human?
//    weak var mother: Human?
//
//    init(name: String){
//        self.name = name
//    }
//    deinit {
//        print(self.name + "   - delete ")
//    }
//}
//
//if 1==1 {
//
//    let Kirill = Human(name: "Кирилл")
//    let Olga = Human(name: "Ольга")
//    let Aleks = Human(name: "Алексей")
//    Kirill.father = Aleks
//    Kirill.mother = Olga
//    Aleks.child.append(Kirill)
//    Olga.child.append(Kirill)
//}


////// Auto reference Control ////

//class Human{
//var name = "Человек"
//    deinit{
//        print("Объект удален")
//    }
//}
//
//var closure : (() -> ())?
//
//if true {
//
//    var human = Human()
//
//    closure = {
//        print(human.name)
//    }
//    closure!()
//}
//
//print("Программа завершена")



class Person {
    let name: String
    init(name: String) { self.name = name }
    
    var apartment: Apartment?
    
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    
    weak var tenant: Person?
    
    deinit { print("Apartment \(unit) is being deinitialized") }
}
var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

// Удаляем обЪекты они должны не deinit а если к связуещему property сделать слабую ссылку weak
// то 1 хер ниче не происходит!!!
john = nil
unit4A = nil












////// unowned ////////


//class Human{
//    var name = "Человек"
//    deinit{
//        print("Объект удален")
//    }
//}
//
//var closure : (() -> ())?
//
//if true {
//
//    var human = Human()
//
//    closure = {
//        [unowned human] in
//        print(human.name)
//    }
//    closure!()
//}
//
//print("Программа завершена")
