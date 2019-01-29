import UIKit

/////////////////////// Subscripts  for Struct and Class //////////////



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
        case white = "Белый"
        case black = "Черный"
    }
    
    let type: ChessFigures
    let color: Color
    let figureSymbol: String
    
    var coordinates: (String, Int)?
    
    init(type: ChessFigures, color: Color, figure: String){
        self.type = type
        self.color = color
        self.figureSymbol = figure
    }
    
    init(type: ChessFigures, color: Color, figure: String, coordinates: (String,Int)){
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

class gameDesk {
    
    var desk: [Int:[String:Chessman?]] = [:]
    
    init(){
        for i in 1...8 {
            desk[i] = [:]
        }
    }
    
    subscript(alpha: String, number: Int) -> Chessman? {
        
        get{
            // Если не nil то вернем значение или дефолт
            return self.desk[number]![alpha] ?? nil
        }
        set {
            
            if let constValue = newValue {
                
                self.setChessman(chess: constValue, coordinates:(alpha, number))
                
            } else {
                
                // Сначало достанем фигуру и очистим ей координаты
                if let chessman = self.getChessman(number: number, char: alpha) {
                    
                    chessman.kill()
                }
                // Потом очистим это поле на доске
                self.desk[number]![alpha] = nil
            }
            
            
        }
    }
    
    func getChessman(number:Int, char: String) -> Chessman? {
        
        return self.desk[number]![char] ?? nil
    }
    
    func setChessman(chess:Chessman, coordinates:(String,Int)) {
        
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.setCoordinates(char: coordinates.0, num: coordinates.1)
    }
    
    func printDesk() -> Void {
        """
        Функция должна вывести на печать шахматную доску
        с содержащимеся на ней фигурами
        """
        
        let dictString = ["A":0,"B":1,"C":2,"D":3,"E":4,"F":5,"G":6,"H":7]
        
        var deskForPrint = [
            (1,["_","_","_","_","_","_","_","_"]),
            (2,["_","_","_","_","_","_","_","_"]),
            (3,["_","_","_","_","_","_","_","_"]),
            (4,["_","_","_","_","_","_","_","_"]),
            (5,["_","_","_","_","_","_","_","_"]),
            (6,["_","_","_","_","_","_","_","_"]),
            (7,["_","_","_","_","_","_","_","_"]),
            (8,["_","_","_","_","_","_","_","_"])
        ]
        
        for (line, dictdata) in self.desk {
            
            if !dictdata.isEmpty {
                
                for figure in Array(dictdata.values) {
                    
                    let picture = figure?.figureSymbol
                    let char = figure?.coordinates?.0
                    
                    let indexElement = dictString[char!]
                    
                    deskForPrint[line - 1].1[indexElement!] = picture ?? "_"
                    
                }
                
            }
            
        }
        
        for line in deskForPrint {
            
            print(String(line.0) + " " + line.1.joined(separator: " "))
            
        }
        print("  " + Array(dictString.keys).sorted().joined(separator: " "))
        
    
    }
    
    
    func printDesk_Update() -> Void {
        """
        Попробую улучшить эту функцию!
        """
        
        let dictString = ["A":0,"B":1,"C":2,"D":3,"E":4,"F":5,"G":6,"H":7]
        
        var deskForPrint = [
            (1,["_","_","_","_","_","_","_","_"]),
            (2,["_","_","_","_","_","_","_","_"]),
            (3,["_","_","_","_","_","_","_","_"]),
            (4,["_","_","_","_","_","_","_","_"]),
            (5,["_","_","_","_","_","_","_","_"]),
            (6,["_","_","_","_","_","_","_","_"]),
            (7,["_","_","_","_","_","_","_","_"]),
            (8,["_","_","_","_","_","_","_","_"])
        ]
        
        for line in self.desk.values {
            
            if !line.isEmpty {
                
                for figure in Array(line.values) {
                    
                    let picture = figure?.figureSymbol
                    let num = figure?.coordinates?.1
                    let char = figure?.coordinates?.0
                    
                    let indexElement = dictString[char!]
                    
                    deskForPrint[num! - 1].1[indexElement!] = picture ?? "_"
                    
                }
                
            }
            
        }
        
        for line in deskForPrint {
            
            print(String(line.0) + " " + line.1.joined(separator: " "))
            
        }
        print("  " + Array(dictString.keys).sorted().joined(separator: " "))
        
        
    }
}


var game = gameDesk()
var QueenBlack = Chessman(type: .quen, color: .black, figure:
    "♛", coordinates: ("A", 1))

var BishopWhite = Chessman(type: .bishop, color: .white, figure:
    "♗", coordinates: ("A", 2))

game["C",1] = QueenBlack
game["C",2] = BishopWhite


game.printDesk()





struct SubTest {
    
    // 2 storege properties
    

    
    var dict = [Int: String]()
    
    init(number:Int, literal:String) {
        
        
        self.dict[number] = literal
    }

    subscript(number: Int) -> String? {
        
        get {
            return self.dict[number]
        }
        
        set(newValue) {
            self.dict[number] = newValue
        }
        
    }
    
    /// Добавим изменен строки
    
    subscript(number: Int, suffix: String) -> String? {
        
        get {
            return self.dict[number]
        }
        
        set(newValue) {
            
            let value = newValue ?? ""
            self.dict[number] = value + suffix
        }
    }
}

var testSub = SubTest(number: 5, literal: "C")
testSub[1] = "A"
testSub[1]

testSub[3, "BBB"] = "3B"
testSub[3]

//// Home Work Chess Desck ////



var arrayString = ["A","B","C","D","E","F","G","H"]

//Dictionary(uniqueKeysWithValues: zip(1...8,arrayString))
//
//dict[1] = ["A": "Bishop"]
//dict[1]!["A"]

var dict: [Int: [String:String?]] = [:]

for i in 1...8 {
    
    for lett in arrayString {
        
        dict [i] = [lett:nil]
        
    }

}


dict[1]!["A"] = "Bishop"
dict[2]!["A"] = "Knight"
dict[1]!["B"] = nil
dict[1]!["B", default: "-"]

print(dict)

//print(dict.sorted{$0.0 < $1.0})
//
//print(type(of: dict.sorted{$0.0 < $1.0}))
