
//  main.swift
//  NSCondition
//
//  Created by PavelM on 05/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation


//let condition = NSCondition()

//var available = false
//var condition = pthread_cond_t()
//var mutex = pthread_mutex_t()
//
//class ConditionMutexPrinter: Thread {
//
//  override init() {
//    pthread_cond_init(&condition, nil)
//    pthread_mutex_init(&mutex, nil)
//  }
//
//  override func main() {
//    printMethod()
//
//  }
//
//  private func printMethod() {
//    pthread_mutex_lock(&mutex)
//    print("Printer enter")
//
//    while (!available) {
//      // Говорим этому потоку заснуть пока не получим сигнал
//      pthread_cond_wait(&condition, &mutex)
//
//    }
//    available = false
//
//    // Тут работате код после подтверждения от первого потока
//
//    defer {
//      pthread_mutex_unlock(&mutex)
//    }
//
//    print("Printer exit")
//  }
//
//}
//
//class ConditionMutexWriter: Thread {
//
//  override init() {
//    pthread_cond_init(&condition, nil)
//    pthread_mutex_init(&mutex, nil)
//  }
//
//  override func main() {
//    writeMethod()
//
//  }
//
//  private func writeMethod() {
//    pthread_mutex_lock(&mutex)
//    print("Writer enter")
//
//    // Здесь деалем код прежде чем разраешить проснутся первому потоку
//    pthread_cond_signal(&condition)
//    available = true
//
//
//    defer {
//      pthread_mutex_unlock(&mutex)
//    }
//
//    print("Writer exit")
//  }
//
//}



//let conditionMutexWriter = ConditionMutexWriter()
//let conditionMutexPrinter = ConditionMutexPrinter()
//
//conditionMutexWriter.start()
//conditionMutexPrinter.start()

////////////////////// NSCondition /////////////////


let condition = NSCondition()
var availabel = false

class Printer: Thread {
  
  override func main() {
    printer()
  }
  
  func printer() {
    // Включаем блокировку
    condition.lock()
    print("Printer Enter")
    
    // Делаем ожидание сигнала от записывающего объекта
    while(!availabel) {
      condition.wait()
    }
    availabel = false
    // Вставляем свой код
    
    defer {
      condition.unlock()
    }
    print("Printer Exit")

  }
  
}

class Writer: Thread {
  
  override func main() {
    write()
  }
  
  func write() {
    condition.lock()
    // Закрыли калитку и работаем спокойно
    print("Writer Enter")
    
    // Дела сделаил и отправляем сигнал
    condition.signal()
    availabel = true
    
    
    defer {
      condition.unlock()
    }
    
    print("Writer Exit")
  }
 
}
let printer = Printer()
let writer = Writer()

printer.start()
writer.start()




////////////////////// NSLOCK ///////////////////////////


// Для памяти попробую вспомнить рекурсив Лок То поток будет знать последовательность блокировок
// если обычный LOCK то будет ошибка! так как поток застрянет между 2мя локам

//var mutex = NSLock()
//var mutex = NSRecursiveLock()
//
//func first() {
//  print("first Func")
//  mutex.lock()
//
//  print("Save Place to Code")
//  second()
//  mutex.unlock()
//}
//
//func second() {
//
//  print("Second Func")
//  mutex.lock()
//
//  print("Save Place to Code")
//
//  mutex.unlock()
//
//}
//
//first()


