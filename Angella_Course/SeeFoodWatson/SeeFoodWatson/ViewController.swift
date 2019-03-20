//
//  ViewController.swift
//  SeeFoodWatson
//
//  Created by PavelM on 11/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
import VisualRecognitionV3
import SVProgressHUD
import Social

// MARK Source Methods and Propertyies
class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var cameraButton: UIBarButtonItem!
  
  @IBOutlet weak var shareButton: UIButton!
  private var imagePicker = UIImagePickerController()
  private var model = Model()
  
  private var classificationArray = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    delegated()
    
    shareButton.isHidden = true
  }
  
  
  
  @IBAction func pushCameraButton(_ sender: UIBarButtonItem) {
    imagePicker.sourceType = .camera
    imagePicker.allowsEditing = false
    
    present(imagePicker,animated: true,completion: nil)
    
  }
  
  @IBAction func sharePushButton(_ sender: UIButton) {
    
    if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
      
      let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
      vc?.setInitialText("My food is \(navigationItem.title ?? "")")
      
      present(vc!, animated: true,completion: nil)
    } else {
      
      self.navigationItem.title = "Please Login Twiter!"
    }
  
  }
  
  
}


// MARK: UIIMAGEPickerDelegate and UINavigatorDelegate
extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    // выключаем карту
    cameraButton.isEnabled = false
    SVProgressHUD.show()
    
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      
      imageView.image = image
      
      imagePicker.dismiss(animated: true, completion: nil)
      
      checkPhoto(at: image)
      
    } else {
      
      print("There was an error")
    }
  }
  
  private func checkPhoto(at image: UIImage) {
    // Просим сделать проверку сообщения
    let visualRecognition = VisualRecognition(version: model.version, apiKey: model.apiKey)
    
    
    visualRecognition.classify(image: image) { (response, error) in
      
      
      guard let result = response?.result?.images.first?.classifiers.first?.classes else {
        
        print(error as Any)
        return
      }
      
      // Добавим ТОП  возможные варианты в массив
      self.classificationArray = []
      
      for index in 0..<result.count {
        
        self.classificationArray.append(result[index].className)
      }
      
      print(self.classificationArray)
      self.hotDogORNot()
      
    }
    
    
  }
  
  func hotDogORNot() {
    
    DispatchQueue.main.async {
      
      self.cameraButton.isEnabled = true
      SVProgressHUD.dismiss()
      self.shareButton.isHidden = false
    }
    
    
    var result = ""
    var color = UIColor()
    var transculatesBool = false
    
    if self.classificationArray.contains("hotdog") {
      
      result = "Its Hot-Dog"
      color = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
      
    } else {
      
      result = "Not Hot-Dog"
      color = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
      transculatesBool = true
    }
    
    DispatchQueue.main.async {
      
      self.navigationItem.title = result
      self.navigationController?.navigationBar.barTintColor = color
      self.navigationController?.navigationBar.isTranslucent = transculatesBool
    }
    
    
  }
  
  
  
  
  
}

// MARK: Support Function
extension ViewController {
  
  private func delegated() {
    imagePicker.delegate = self
  }
  
}

