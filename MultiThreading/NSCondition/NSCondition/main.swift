//
//  main.swift
//  NSCondition
//
//  Created by PavelM on 05/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation


//let condition = NSCondition()

var available = false
var condition = pthread_cond_t()
var mutex = pthread_mutex_t()

class ConditionMutexPrinter: Thread {
  
  override init() {
    pthread_cond_init(&condition, nil)
    pthread_mutex_init(&mutex, nil)
  }
  
  override func main() {
    print("Start Printer")
    printMethod()
    
  }
  
  private func printMethod() {
    pthread_mutex_lock(&mutex)
    print("Printer enter")
    
    while (!available) {
      // Говорим этому потоку заснуть пока не получим сигнал
      pthread_cond_wait(&condition, &mutex)
      
    }
    available = false
    
    // Тут работате код после подтверждения от первого потока
    
    defer {
      pthread_mutex_unlock(&mutex)
    }
    
    print("Printer exit")
  }
  
}

class ConditionMutexWriter: Thread {
  
  override init() {
    pthread_cond_init(&condition, nil)
    pthread_mutex_init(&mutex, nil)
  }
  
  override func main() {
    print("Start Writer")
    writeMethod()
    
  }
  
  private func writeMethod() {
    pthread_mutex_lock(&mutex)
    print("Writer enter")
  
    // Здесь деалем код прежде чем разраешить проснутся первому потоку
    pthread_cond_signal(&condition)
    available = true
   
    
    defer {
      pthread_mutex_unlock(&mutex)
    }
    
    print("Writer exit")
  }
  
}



let conditionMutexWriter = ConditionMutexWriter()
let conditionMutexPrinter = ConditionMutexPrinter()

conditionMutexWriter.start()
conditionMutexPrinter.start()
































////////////////////// NSLOCK ///////////////////////////


// Для памяти попробую вспомнить рекурсив Лок То поток будет знать последовательность блокировок
// если обычный LOCK то будет ошибка! так как поток застрянет между 2мя локам
//var mutex = NSLock()
//var mutex = NSRecursiveLock()

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

