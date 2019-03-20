//
//  ViewController.swift
//  ConvertMLModel
//
//  Created by PavelM on 12/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//


// Итак нужно разработать приложение которое будет определять какой цветок у нас на фотке

/*
 1. Мы должны фоткать
 
 2. Выводить фотку на экран
 
 3. Использовать модель
 
 */

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

  @IBOutlet weak var cameraButton: UIBarButtonItem!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var textView: UITextView!
  
  let model = Model()
  
  private var imagePicker = UIImagePickerController()
  
  
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    delegate()
    
    textView.isHidden = true
  }
  

  @IBAction func pressCameraButton(_ sender: UIBarButtonItem) {
    
    imagePicker.sourceType = .camera
    imagePicker.allowsEditing = true
    
    present(imagePicker,animated: true,completion: nil)
  }
  
}

//MARK: -UIImagePickerDelegate and NavigationControllerDelegate

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  
  func delegate() {
    
    imagePicker.delegate = self
  }
  
  
  // Это когда пользователь в pickere нажимает кнопку
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
      
      fatalError("Не получили картинку")
    }
    
    imageView.image = image
    
    // Возвращаемся обратно
    imagePicker.dismiss(animated: true, completion: nil)
    
    getResult(with: image)
    
    
  }

}

// MARK: Get Result Func
extension ViewController {
  
  func getResult(with image: UIImage) {
    
    // Получаем результат классификации и выводим его на NavigationBar
    model.image = image
    let flowerName = model.getClassifire()
    
    DispatchQueue.main.async {
      self.navigationItem.title = flowerName
    }
    
    getDescribeWikipedia(resultString: flowerName)
    
    self.textView.isHidden = false

    
  }
  
  func getDescribeWikipedia(resultString: String) {
    
    // Я имею ссылку Api и параметры! Теперь нужно сделать request запрос
    
    // Нужно менять здесь в clousere
    var parameters = model.parameters
    
    parameters["titles"] = resultString
    
    Alamofire.request(model.wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
      
      if response.result.isSuccess {
        print("Запрос прошел успешно")
        
        guard let resultJson: JSON = JSON(response.result.value!) else {
          fatalError("Не удалось конвертировать в JSON")
        }
        
        // Если обновить в этом потоке то все будет норм
        self.textView.text = self.model.updateJsonData(with: resultJson)
        
        
      } else {
        print(response.result.error!)
        
        self.textView.text = "Запрос на википедию не прокатил"
      }
    }
    
  }
}





