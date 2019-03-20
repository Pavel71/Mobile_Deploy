import Foundation

var str = "GCD Start"


class QueueTest1 {
  
  private let serialQueue = DispatchQueue(label: "serialTest")
  private let concaratQueue = DispatchQueue(label: "concurrentTest", attributes: .concurrent)
  
  
}

class QueueTest2 {
  
  private let globalQueue = DispatchQueue.global()
  private let mainQueue = DispatchQueue.main
  
  
}
