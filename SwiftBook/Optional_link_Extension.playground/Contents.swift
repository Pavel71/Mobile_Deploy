import UIKit


//////////////// OPTIONAL LINK ///////////////


//class Person {
//
//    var residence: Residence?
//}
//
//class Residence {
//
//var numberOfRooms = 1
//
//}
//
//var man = Person()
//
//if let manResidence = man.residence {
//    print("Есть дом с \(manResidence.numberOfRooms) комнатами")
//
//}else{
//    print("Нет дома")
//}

class Person {
    var residence: Residence?
    
}

class Residence {
    var numberOfRooms = 1
    var room: Room?
    
    func returnNumberOfRoom() -> Int {
        
        return self.numberOfRooms
    }
}

class Room {
    var square: Int = 10
}

var man = Person()
var residence = Residence()
var room = Room()

man.residence = residence
residence.room = room

if let square = man.residence?.room?.square {
    print("Площадь \(square) кв.м.")
    }else{
    print("Комнаты отсутствуют")
    }

man.residence?.room?.square = 36
man.residence?.room?.square
room.square

man.residence?.returnNumberOfRoom()



//////////////// EXTENTION /////////

extension Double {
    
    var km: Double { return self * 1000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("Один фут — это \(oneInch) метра")

let threeFeet = 3.ft
print("Три фута — это \(threeFeet) метра")


struct Line{
    
    var pointOne: (Double, Double)
    var pointTwo: (Double, Double)
}

extension Double {
    
    init(line: Line){
        
        self = sqrt(pow((line.pointTwo.0 - line.pointOne.0),2) + pow((line.pointTwo.1 - line.pointOne.1),2))
        }
}

var myLine = Line(pointOne: (10,10), pointTwo: (14,10))
var lineLength = Double(line: myLine)



/////// Extension Clousere //////////
extension Int {
    
    func repetitions(task: () -> ()) {
        
        for _ in 0..<self {
            task()
        }

    }

}

2.repetitions {
    print("Swift")
}

extension Int {
    mutating func square() {
        
        self *= self
        }
    }

var someInt = 3
someInt.square()

