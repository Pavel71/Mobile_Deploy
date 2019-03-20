import Cocoa

var str = "Dispatch_Group"


class DispatchGroutTest1 {
  
  // Выполнение пойдет последовательно Тоесть мы не перещелкнимся к следующему участку кода
  private let queueSerial = DispatchQueue(label: "Serial")
  private let groupRED = DispatchGroup()
  
  func loadInfo() {
    
    queueSerial.async(group: groupRED) {
      sleep(1)
      print(1)
    }
    
    queueSerial.async(group: groupRED) {
      sleep(1)
      print(2)
    }
    
    groupRED.notify(queue: .main) {
      print("Пришли в main поток")
    }
  }
}

let dispatchGroupTest1 = DispatchGroutTest1()
//dispatchGroupTest1.loadInfo()


class DispatchGroutTest2 {
  
  private let queueConcurent = DispatchQueue(label: "Serial", attributes: .concurrent)
  
  private let groupBlack = DispatchGroup()
  
  func loadInfo() {
    
    groupBlack.enter()
    queueConcurent.async {
      sleep(1)
      print("1")
      self.groupBlack.leave()
    }
    
    groupBlack.enter()
    queueConcurent.async {
      sleep(1)
      print("2")
      self.groupBlack.leave()
    }
    
    // Пока все потоки в группе работаю дальше не идем
    groupBlack.wait()
    print("Finish All")
    
    groupBlack.notify(queue: .main) {
      
      print("Все выполняем код после отработки потоков")
    }
  }
}

let dispatchGroupTest2 = DispatchGroutTest2()
dispatchGroupTest2.loadInfo()

// Переходим к проекту в файл GCD
