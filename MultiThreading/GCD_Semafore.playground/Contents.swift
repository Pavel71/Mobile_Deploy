import Cocoa

var str = "GCD_Semafore"

let queue = DispatchQueue(label: "First",attributes: .concurrent)

// Этим объектом мы регулируем кол-во потоков которым может выделятся процесорное время
let semaphore = DispatchSemaphore(value: 0)

queue.async {
  
  semaphore.wait() // -1
  sleep(3)
  print("Method 1")
  semaphore.signal()
  
}

queue.async {
  
  semaphore.wait() // -1
  sleep(3)
  print("Method 2")
  semaphore.signal()
  
}

queue.async {
  
  semaphore.wait() // -1
  sleep(3)
  print("Method 3")
  semaphore.signal()
  
}

let sema = DispatchSemaphore(value: 0)

// По сути мы натравливаем на код 10 потоков
DispatchQueue.concurrentPerform(iterations: 10) { (id: Int) in

  sema.wait(timeout: DispatchTime.distantFuture)
  sleep(1)
  print("Block",String(id))
  sema.signal()
}

class SemaphoreTest {
  
  private let semaphoreClass = DispatchSemaphore(value: 2)
  private var array = [Int]()
  
  private func methodWork(_ id: Int) {
    
    semaphoreClass.wait()
    array.append(id)
    print("Test Array", array.count)
    sleep(2)
    semaphoreClass.signal()
  }
  
  func startAllThread() {
    
    DispatchQueue.global().async {
      self.methodWork(100)
      print(Thread.current)
    }
    DispatchQueue.global().async {
      self.methodWork(1100)
      print(Thread.current)
    }
    DispatchQueue.global().async {
      self.methodWork(1002)
      print(Thread.current)
    }
    DispatchQueue.global().async {
      self.methodWork(1030)
      print(Thread.current)
    }
  }
}

let semaphoreTest = SemaphoreTest()
semaphoreTest.startAllThread()
