import Cocoa

var str = "Operation"

print(Thread.current)

let operation = {
  
  print("Start")
  print(Thread.current)
  print("Finish")
}
// По умолчанию код запускается не в главном потоке
//let queue = OperationQueue()
//queue.addOperation(operation)


var result: String?
// Класс наследник от Operation
let concatOperation = BlockOperation {
 result = "Swfit"
  print(Thread.current)
}

// Тоже будет исполнятся синхронно так как нет Очереди распределителя!
//concatOperation.start()
//print(result!)

//let queue = OperationQueue()
//queue.addOperation(concatOperation)
//print(result!)


//let queue = OperationQueue()
//
//queue.addOperation {
//  result = "Swfit"
//  print(Thread.current)
//}


////////////////////////// Operation 2 ////////////////////



let operationQueue = OperationQueue()

class OperationCancelTest: Operation {
  
  override func main() {
    
    if isCancelled {
      print(isCancelled)
      return
    }
    
    print("Test 1")
    sleep(1)
    
    if isCancelled {
      print(isCancelled)
      return
    }
    print("Test 2")
  }
}

func cancelOperationMethod() {
  
  let cancelOperation = OperationCancelTest()
  operationQueue.addOperation(cancelOperation)
  cancelOperation.cancel()
}

//cancelOperationMethod()

class WaitOperationTest: Operation {
  private let operationQueue = OperationQueue()
  
  func test() {
    operationQueue.addOperation {
      sleep(1)
      print("Test 1")
    }
    
    operationQueue.addOperation {
      sleep(3)
      print("Test 2")
    }
    
    // Барьер!
    operationQueue.waitUntilAllOperationsAreFinished()
    
    operationQueue.addOperation {
      sleep(2)
      print("Test 3")
    }
    
    operationQueue.addOperation {
      
      print("Test 4")
    }
    
  }
}

let waitOper = WaitOperationTest()
//waitOper.test()

class WaitOperationTest2: Operation {
  
  private let operationQueue = OperationQueue()
  
  func test() {
    let operation1 = BlockOperation {
      sleep(1)
      print("Test1")
    }
    let operation2 = BlockOperation {
      sleep(2)
      print("Test2")
    }
    let operation3 = BlockOperation {
      sleep(3)
      print("Test3")
    }
    
    // Гораздо удобнее пользоватся Operation
    // Здесь мы передали операции массивом и указали дождатся их выполнения
    // Выполнение пойдет асинхронно в новом потоке
    operationQueue.addOperations([operation1,operation3], waitUntilFinished: true)
    
    operationQueue.addOperation(operation2)
  }
}

let waitOper2 = WaitOperationTest2()
//waitOper2.test()

class CompletionBlockTest {
  
  private let operationQueue = OperationQueue()
  
  func test() {
    // Устанавливаем кол-во потоков
    operationQueue.maxConcurrentOperationCount = 2 // 1 Ыукшфд
    
    let operation1 = BlockOperation {
      print("Test CompletionBlock")
      print(Thread.current)
    }
    // передаем задание по завершению задачи
    operation1.completionBlock = {
      print("Finish")
      print(Thread.current)
    }
    // Настраиваем приоритет
    operation1.qualityOfService = .userInteractive
    
    operationQueue.addOperation(operation1)
    
  }
}

let complitonBlock = CompletionBlockTest()
complitonBlock.test()


