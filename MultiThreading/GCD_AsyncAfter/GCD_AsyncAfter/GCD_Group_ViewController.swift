//
//  GCD_Group_ViewController.swift
//  GCD_AsyncAfter
//
//  Created by PavelM on 15/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
/*
 Я просто к тому что благодаря Dipatch group и DispatchWorkItem  я могу передавать блоки кода и объеденять их в группы чтобы можно было ими упарвлять скажем дожидатся выполнения
 
 Скажем я сделаю 2 Item и по их завершению выведу на экран обновление UILabel
 
 
 */


class GCD_Group_ViewController: ViewController {
  
  @IBOutlet weak var numbPhotoLabel: UILabel!
  
  
  @IBOutlet var imageViewArray: [UIImageView]!
  var imageArray = [UIImage]()
  
  var firstGroup = DispatchGroup()
  
  let urlArray = ["https://avatars.mds.yandex.net/get-pdb/1054037/892a0eab-b95b-4f37-8cc0-252d02580153/s1200?webp=false", "https://avatars.mds.yandex.net/get-pdb/221187/fecd3be6-4b0e-467a-8353-542793c8bdec/s1200?webp=false","https://www.eurodom.ru/upload/iblock/846/84618058aa1001ed76f7241474e2567b.JPEG","https://zabavnik.club/wp-content/uploads/Kartinki_pro_apelsin_17_24042021-968x1024.png"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    LoadPhoto()
    updateLabel()
    
  }
  
  
  private func LoadPhoto() {
    // Создаем задачу
    let itemLoad = DispatchWorkItem {
      
      for i in 0...3 {
        
        let url = URL(string: self.urlArray[i])
        guard let data = try? Data(contentsOf: url!) else {return}
        self.imageArray.append(UIImage(data: data)!)
      }
    }
    
    
    // Передаем задачу в распределительный центр! В Группе FirstGroup
    DispatchQueue.global().async(group: firstGroup, execute: itemLoad)
    
    itemLoad.notify(queue: .main) {
      print("Закачка фоток завершенна")
      self.UpdatePhoto()
      // Также я могу обновить это здесь! Но например я хочу запустить обновление UI в другом месте Метод UpdateLabel основываясь на моей  firstGroup
//      self.numbPhotoLabel.text = "Обновление завершенно!"
    }

    
  }
  
  private func UpdatePhoto() {
    print("Обновление ImageView")
    for i in 0...3 {
      
      self.imageViewArray[i].image = self.imageArray[i]
    }

    
  }
  private func updateLabel() {
    
    // Вся идея в том что запустить последний метод когда вся группа закончит свою работу
    print("Ожидаю окончания работы группы и после запускаю код!")
    
    // Выполни в главном потоке по завершению работы всех Itemov!
    firstGroup.notify(queue: .main) {
      self.numbPhotoLabel.text = "Обновление завершенно!"
    }
    
  }
  
  
  
  
  private func updateLoadPhotoTogether() {
    
    DispatchQueue.global().async {
      
    }
    
    DispatchQueue.main.async {
      for i in 0...3 {
        
        self.imageViewArray[i].image = self.imageArray[i]
      }
    }
  }




func asyncURLSession() {
  
  for i in 0...3 {
    let url = URL(string: urlArray[i])
    let request = URLRequest(url: url!)
    let task = URLSession.shared.dataTask(with: request) { (data,response,error) in
      DispatchQueue.main.async {
        self.imageViewArray[i].image = UIImage(data: data!)
      }
    }
    
    task.resume()
    
  }
}






private func asyncGoup() {
  let aGroup = DispatchGroup()
  
  for i in 0...3 {
    aGroup.enter()
    asyncLoadImage(imageURL: URL(string: urlArray[i])!, runQueue: .global(), completionQueue: .main) { (image, error) in
      guard let image = image else {fatalError("Нет картинки")}
      self.imageArray.append(image)
      aGroup.leave()
    }
  }
  
  aGroup.notify(queue: .main) {
    
    for i in 0...3 {
      self.imageViewArray[i].image = self.imageArray[i]
    }
  }
}


private func asyncLoadImage(imageURL: URL, runQueue: DispatchQueue, completionQueue: DispatchQueue, complition: @escaping (UIImage?, Error?) -> Void) {
  // escaping complition Позволяет вернуть обратно картинку и ошибку
  
  runQueue.async {
    do{
      let data = try Data(contentsOf: imageURL)
      
      completionQueue.async {
        complition(UIImage(data: data), nil)
      }
      
    } catch let error{
      
      completionQueue.async {
        complition(nil, error)
      }
      
    }
  }
}




// ViewController не будет блокироватся но загрузка пойдет последовательно по циклу
private func loadPhotoAsync() {
  
  DispatchQueue.global().async {
    
    for (index, url) in self.urlArray.enumerated() {
      
      guard let url = URL(string: url) else {
        fatalError("Не получили URL")
      }
      
      if let data = try? Data(contentsOf: url) {
        DispatchQueue.main.async {
          self.imageViewArray[index].image = UIImage(data: data)
        }
        
      } else {
        print("Не скачала фотку")
      }
    }
  }
  
  
}

// НЕ работает!
private func loadPhotoConcarentIteration() {
  
  let queue = DispatchQueue(label: "Concarent Iter",  attributes: .concurrent)
  
  // Запросим 4 потока на загрузку фоток
  DispatchQueue.concurrentPerform(iterations: 4) { (index) in
    
    
    guard let url = URL(string: self.urlArray[index]) else {
      fatalError("Не получили URL")
    }
    
    if let data = try? Data(contentsOf: url) {
      DispatchQueue.main.async {
        self.imageViewArray[index].image = UIImage(data: data)
      }
      
    } else {
      print("Не скачала фотку")
    }
    
  }
}






// Блокируется View Controller пока не произойдет загрузка последней картинки
  private func loadPhotoBlockMain() {

  // Сделаю загрузку через Data

  // в 1 потоке последовательно

  for (index, url) in urlArray.enumerated() {
    
    guard let url = URL(string: url) else {
      fatalError("Не получили URL")
    }
    
    if let data = try? Data(contentsOf: url) {
      
      imageViewArray[index].image = UIImage(data: data)
    } else {
      print("Не скачала фотку")
    }
  }

  }

}



