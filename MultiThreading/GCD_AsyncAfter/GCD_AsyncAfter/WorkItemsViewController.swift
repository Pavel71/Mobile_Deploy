//
//  WorkItemsViewController.swift
//  GCD_AsyncAfter
//
//  Created by PavelM on 14/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class WorkItemsViewController: ViewController {
  @IBOutlet weak var numberLabel: UILabel!
  
  @IBOutlet weak var imageView: UIImageView!
  
  let imageUrl = URL(string: "https://zabavnik.club/wp-content/uploads/yabloko_ayfon_21_25112331.jpg")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("viewDidLoad")
    
    /// Simple Async
    //    changeNumberLabel()
    //    loadPhoto()
    
    /// WorkItems Code
    // Данный вариант не особо подойдет если надо обновлять в каждой итерации! А если после проделанной работы то запроста!
//    loadPhotoWorkItems()
//    updateNumberWorkItem()
    
    /// URLSession
//    changeNumberLabel()
    
    uodateNumberConcarent()
    loadPhotoURLSession()
    
    print("Процессорное время раздали ждем выполнения задач!")
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("ViewDIDAppear")
    
    
  }
  
  private func uodateNumberConcarent() {
    
    DispatchQueue.global().async {
      
      for i in 0...5 {
        sleep(1)
        DispatchQueue.main.async {
          self.numberLabel.text = String(i)
        }
      }
      
      
    }
    
//    DispatchQueue.concurrentPerform(iterations: 5) { (i) in
//      sleep(1)
//      self.numberLabel.text = String(i)
//    }
  }
  
  // URL Session
  
  func loadPhotoURLSession() {
    
    // URLSession запускается асинхронно из коробки
    
    let task = URLSession.shared.dataTask(with: imageUrl!) { (data, response, error) in

      if let imageData = data {
        
        DispatchQueue.main.async {
          self.imageView.image = UIImage(data: imageData)
        }
      }
    }
    
    task.resume()
  }
  
  
  
  
  
  
  
  
  
  
  func loadPhotoWorkItems() {
    
    print("LoadPhoto")
    
    var data: Data?
    
    let queue = DispatchQueue.global(qos: .utility)
    
    // Создана задача для паралельного исполнения
    let workItem = DispatchWorkItem(qos: .userInteractive) {
      
      data = try? Data(contentsOf: self.imageUrl!)
      print("Загрузили фотку")
      
    }
    // Добавили задачу в очередь
    queue.async(execute: workItem)
    
    // По завершению нашей задачи мы просим выполнить следующий код
    // Вернуть в главный поток
    workItem.notify(queue: DispatchQueue.main) {
      print("Notify Photo")
      guard let imageData = data else {
        fatalError("Не получили фотку")
      }
      self.imageView.image = UIImage(data: imageData)
    }
    
  }
  
  func updateNumberWorkItem() {
    
    print("updateNumberWorkItem")
    
    var numb: Int?
    
    let workItem = DispatchWorkItem {
      
      for i in 0...5 {
        sleep(1)
        numb = i
        
      }
    }
    
    DispatchQueue.global().async(execute: workItem)
    
    workItem.notify(queue: DispatchQueue.main) {
      print("Notify Number")
      self.numberLabel.text = String(numb!)
      
    }
    
  }
  
  
  
  
  
  
  // MARK: Simple Async
  // Это простое написание многозадачного кода
  
  private func loadPhoto() {
    print("LoadPhoto")
    
    DispatchQueue.global().async {
      
      if let data = try? Data(contentsOf: self.imageUrl!) {
        
        // Как только получим фотку поставить ее в главную очередь
        DispatchQueue.main.async {
          self.imageView.image = UIImage(data: data)
        }
        
      } else {
        print("Нет Картинки")
      }
      
    }
    
    
  }
  
  private func changeNumberLabel() {
    print("ChangeNumber")
    
    // Так он не обновит Label! Нужно возвращать в main
    DispatchQueue.global().async {
      
      for i in 0...5 {
        sleep(1)
        
        DispatchQueue.main.async {
          self.numberLabel.text = String(i)
        }
        
      }
    }
    
    
  }
  
  
  
  
}
