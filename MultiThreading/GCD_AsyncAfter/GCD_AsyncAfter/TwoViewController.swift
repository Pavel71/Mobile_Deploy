//
//  TwoViewController.swift
//  GCD_AsyncAfter
//
//  Created by PavelM on 14/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class TwoViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//      for i in 0...20000 {
//
//        print(i)
//      }
      
      /// Парарельные итерации по свободным потокам но в главном потоке
      
//      DispatchQueue.concurrentPerform(iterations: 20000) {
//        print("\($0) times")
//      }
      
      
      /// Паралельное вычесление!
      
//      let queue = DispatchQueue.global(qos: .utility)
//
//      queue.async {
//        DispatchQueue.concurrentPerform(iterations: 20000) {
//          print("\($0) times")
//        }
//      }
      
      
      
//      myInactiveQueue()
    }
  
  func myInactiveQueue() {
    
    let inactiveQueue = DispatchQueue(label: "Uncle Pasha", qos: .default, attributes: [.concurrent, .initiallyInactive])
    
    inactiveQueue.async {
      print("Done")
    }
    
    print("not yet startet ....")
  
//    inactiveQueue.activate()
//    print("Activate!")
//    inactiveQueue.suspend()
//    print("Sleep")
//    inactiveQueue.resume()
//    print("Resume доделай до конца!")
    
    // Или Так Когда главный поток дойдед до конца запустить активную задачу
    
    inactiveQueue.activate()
    print("Activate!")
  }


}
