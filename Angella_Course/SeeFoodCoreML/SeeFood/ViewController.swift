//
//  ViewController.swift
//  SeeFood
//
//  Created by PavelM on 06/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {

  @IBOutlet weak var contentImageView: UIImageView!
  
  private let imagePicker = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imagePicker.sourceType = .camera
    imagePicker.allowsEditing = false
    
    delegated()
    
  }
  
  private func delegated() {
    imagePicker.delegate = self
    
  }


  @IBAction func cameraTap(_ sender: UIBarButtonItem) {
    
    present(imagePicker, animated: true, completion: nil)
  }
  
}

// MARK: UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate {
  
  // Цепляет картинку
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    guard let userImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
      fatalError("Не пришла картинка")
    }
    
    // Преобразуем картинку для модели машинного обучения
    guard let ciImage = CIImage(image: userImage) else {
      fatalError("Не получилось преобразовать картинку")
    }
    
    detected(image: ciImage)
    
    // Ставим картинку на главный экран контроллера
    contentImageView.image = userImage
    
    imagePicker.dismiss(animated: true, completion: nil)
  }
  
  
  private func detected(image: CIImage) {

    guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
      fatalError("Модель не загрузилась")
    }
    
    let request = VNCoreMLRequest(model: model) { (request, error) in
      
      guard let results = request.results as? [VNClassificationObservation] else {
        
        fatalError("Не получили результаты")
      }
      
      if let targetString = results.first?.identifier {
        
        self.navigationItem.title = targetString
      }
      
      
    }
    
    
    
    let handler = VNImageRequestHandler(ciImage: image)
    
    do {
      
      try handler.perform([request])
      
    } catch {
      print(error)
    }
    
  }
  
}

// MARK: UINavigationControllerDelegate
extension ViewController: UINavigationControllerDelegate {
  
}
