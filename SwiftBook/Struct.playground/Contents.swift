import UIKit

////////////////////// STRUCT //////////////


struct PlayerInChess {
    var name: String
    var wins: UInt

}

var oleg = PlayerInChess(name: "Олег", wins: 32)



//struct PlayerInChess {
//
//    var name = ""
//    var wins: UInt = 0
//}
//
//
//var oleg = PlayerInChess(name: "Олег", wins: 32)
//var maks = PlayerInChess()
//maks.name = "Maks"
//maks.name



struct PlayerInChess {
    
    var name: String
    var wins: UInt = 0
    
    init(name: String) {
        
        self.name = name
    }
}
var oleg = PlayerInChess(name: "Олег")
oleg.wins

// HomeWork/////

//enum ChessFigures: String {
//
//    case king = "Король"
//    case knight = "Конь"
//    case bishop = "Слон"
//    case tower = "Ладья"
//    case quen = "Ферзь"
//    case guarder = "Пешка"
//
//}
//
//enum Color: String {
//    case wight = "Белый"
//    case black = "Черный"
//}
//
//struct Chessmen {
//
//    var figure: ChessFigures
//    var colorFigure: Color
//    var coordinat: (String,UInt)?
//
//    init(figure: ChessFigures, colorFigure: Color) {
//
//        self.figure = figure
//        self.colorFigure = colorFigure
//    }
//
//}
//
//var towerWight = Chessmen(figure: ChessFigures.tower, colorFigure: Color.wight)
//towerWight.figure.rawValue



struct PlayerInChess_2 {
    var name: String
    var wins: UInt
    
    mutating func addWins(_ countWins: UInt) {
        
        self.wins += countWins
    }
    
}

var oleg_2 = PlayerInChess_2(name: "Олег", wins: 15)
oleg_2.wins
oleg_2.addWins(3)
oleg_2.wins




struct Chessmen {
    
    enum ChessFigures: String {
        
        case king = "Король"
        case knight = "Конь"
        case bishop = "Слон"
        case tower = "Ладья"
        case quen = "Ферзь"
        case guarder = "Пешка"
        
    }
    
    enum Color: String {
        case wight = "Белый"
        case black = "Черный"
    }
    
    var figure: ChessFigures
    var colorFigure: Color
    var coordinat: (String,UInt)?
    
    // Это инициализатор без координат
    init(figure: ChessFigures, colorFigure: Color) {
        
        self.figure = figure
        self.colorFigure = colorFigure
    }
    
    // Это инициализатор с координатами
    
    init(figure: ChessFigures, colorFigure: Color, coordinat: (String, UInt)) {
        
        self.figure = figure
        self.colorFigure = colorFigure
        self.coordinat = coordinat
    }
    
    
    mutating func setCooedinats (char: String, num: UInt) {
        
        self.coordinat = (char,num)
    }
    
    mutating func kill () {
        
        self.coordinat = nil
    }
    
}

var whiteBishop = Chessmen(figure: .bishop, colorFigure: .wight)
whiteBishop.setCooedinats(char: "A", num: 1)
whiteBishop.coordinat
whiteBishop.kill()
whiteBishop.coordinat
