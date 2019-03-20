//
//  Model.swift
//  ConvertMLModel
//
//  Created by PavelM on 12/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

/*
 
 Класс:
 1. Получает картинку
 2. Применяет модель МЛ
 3. Возвращает результат
 
 */

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON

class Model: NSObject {
  
  var image: UIImage!
  
  let wikipediaURl = "https://en.wikipedia.org/w/api.php"
  
  var parameters : [String:String] = [
    "format" : "json",
    "action" : "query",
    "prop" : "extracts",
    "exintro" : "",
    "explaintext" : "",
    "titles" : "myFlowerName",
    "indexpageids": "",
    "redirects" : "1",
    ]
  
  
  // Функция получает предсказание и выводит ответ на и возвращает строку с ответом
  
  func getClassifire() -> String {
    
    
    var resultString = ""
    
    // Преобразуем картинку для модели машинного обучения
    guard let ciImage = CIImage(image: self.image) else {
      fatalError("Не получилось преобразовать картинку")
    }
    
    guard let ml = try? VNCoreMLModel(for: FlowerClassifier().model) else {
      
      fatalError("Не подключилась модель!")
    }
    
    
    // Формируем запрос для модельки
    
    let request = VNCoreMLRequest(model: ml) { (request, error) in
      
      guard let result = request.results as? [VNClassificationObservation] else {
        
        fatalError("Не получили результата")
      }
      
      if let targetString = result.first?.identifier.capitalized {
        
        resultString = targetString
        
      }
          
    }
    
    // Делаем запрос!
    let handler = VNImageRequestHandler(ciImage: ciImage)
    
    do {
      
      try handler.perform([request])
      
    } catch {
      print(error)
    }
    
    return resultString
  }
  
  
  // Принимает JSON возвращает строку с описание объекта
  func updateJsonData(with json: JSON) -> String {
    
    print("UpdateJson")
    
    // Сначало получим pageid
    
    let pagesID = json["query"]["pageids"][0].stringValue
    
    let extract = json["query"]["pages"][pagesID]["extract"].stringValue
  
    
    return extract
    
  }

  
}
