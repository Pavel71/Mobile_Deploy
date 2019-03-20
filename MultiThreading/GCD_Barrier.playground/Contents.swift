import Cocoa

var str = "Barrier"

var aray = [Int]()

//for i in 0...9 {
//
//  aray.append(i)
//}



DispatchQueue.concurrentPerform(iterations: 10) { (index) in
  aray.append(index)
}
print(aray)
print(aray.count)


class SaveArray <T> {
  
  private var array = [T]()
  private let queue = DispatchQueue(label: "Concarent Que", attributes: .concurrent)
  var group = DispatchGroup()
  
  public func append(_ value: T) {
    
    queue.async(group: group, qos: .default, flags: .barrier) {
      self.array.append(value)
    }
   
  }
  
  public func valueArray()  -> [T] {
    var result = [T]()
    
    // Говорим не передавать больше процессорного времени а дождатся выполнения этого кода
    queue.sync {
      result = self.array
    }
    
    return result
  }
}

var arraySave = SaveArray<Int>()

DispatchQueue.concurrentPerform(iterations: 10) { (index) in
  
  arraySave.append(index)
}

print("Save Array \(arraySave.valueArray())")
print("Save Array Count \(arraySave.valueArray().count)")



