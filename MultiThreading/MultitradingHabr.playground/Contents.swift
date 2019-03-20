import Cocoa

var str = "Multitrading"

var value = "👻"

func changeValue(variant: Int) {
  sleep(1)
  value = value + "🎃"
  print(value, variant)
}

//func task(_ symbol: String) {
//  for i in 1...10 {
//    print("\(symbol) \(i) приоритет = \(qos_class_self().rawValue)")
//  }
//}
//
//func Hightask(_ symbol: String) {
//  for i in 1...10 {
//    print("\(symbol) \(i) HIGH приоритет = \(qos_class_self().rawValue)")
//  }
//}

// Последовательная очередь!
let userQueue = DispatchQueue(label: "UserQueu")

/// Задачи выполняются последовательно + мы ожидаем завершения задачи

//userQueue.sync {
//  task("🎃")
//}
//task("🥶")

// Задачи выполняются последовательно + мы отщелкиваем задачу и идем дальше

//// Сначала пойдет оранжевая морда потом синяя потом зеленая
//userQueue.async {
//  task("🎃")
//}
//userQueue.async {
//  task("🤢")
//}
//
//task("🥶")

/// Задачи отщелкнутся до синхронной потом они будут выполнятся вперемешку и в конце выполнится задача main потока
let userQueueConcarent = DispatchQueue(label: "UserQueu",attributes: .concurrent)

//userQueueConcarent.async {
//  task("🎃")
//}
//userQueueConcarent.async {
//  task("🤢")
//}
//userQueueConcarent.sync {
//  task("🥶")
//}
//
//task("👿")

/// Хорошо Теперь поработаю с потокобезопасные переменными

public class ThreadSafeString {
  
  private var internalString = ""
  let isolationQueue = DispatchQueue(label: "com.pavelM.isolation",  attributes: .concurrent)
  
  public func addString(string: String) {
    // Добавляем задачу с Барьером! Задача начнет выполнение и остановит очередь пока не закончатся другие задачи
    isolationQueue.async(flags: .barrier) {
      self.internalString = self.internalString + string
    }
  }
  
  public func setString(string: String) {
    isolationQueue.async(flags: .barrier) {
      self.internalString =  string
    }
  }
  
  public init (_ string: String) {
    isolationQueue.async(flags: .barrier) {
      self.internalString = string
    }
  }
  // Метод по чтению строки
  // Так как все остальные методы на барьере значит они все будут ждать выполнения метода чтения! Так как он синхронный
  public var text: String {
    var result = ""
    isolationQueue.sync {
      result = self.internalString
    }
    return result
  }
  
  
}

var safeString = ThreadSafeString("")
var usualString = ""

let userQueueConcarentAddString = DispatchQueue(label: "UserQueu",attributes: .concurrent)

func task(_ symbol: String) {
  for i in 1...10 {
    print("\(symbol) \(i) приоритет = \(qos_class_self().rawValue)")
    safeString.addString(string: symbol)
    usualString = usualString + symbol
  }
}


userQueueConcarentAddString.async {
  task("🎃")
}
task("👿")

print("ThreadSafe \(safeString.text)")
print("UsualString \(usualString)")


