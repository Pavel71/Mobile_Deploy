//
//  ViewController.swift
//  GCD_AsyncAfter
//
//  Created by PavelM on 14/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
//    afterBlock(seconds: 2, queue: .global()) {
//
//      print("Hello")
//      print(Thread.current)
//    }
    
//    afterBlock(seconds: 2) {
//      self.showAlert()
//      print(Thread.current)
//    }
    
  }
  

  
  func afterBlock(seconds: Int, queue: DispatchQueue = DispatchQueue.global() ,complition: @escaping () -> Void) {
    
    queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
      complition()
    }
    
  }
  
  func showAlert() {
    
    let alertController = UIAlertController(title: "Hello", message: "Это поток", preferredStyle: .alert)
    let alert = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
    alertController.addAction(alert)
    
    present(alertController,animated: true,completion: nil)
  }


}

