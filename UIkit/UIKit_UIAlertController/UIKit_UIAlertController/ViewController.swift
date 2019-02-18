//
//  ViewController.swift
//  UIKit_UIAlertController
//
//  Created by PavelM on 01/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var hiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func showButton(_ sender: UIButton) {
        
        self.alert(title: "Внимание!", message: "Введите ваше имя", style: .alert)
    }
    
    // 2
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        
        self.hiLabel.text = "Hi,"
        
        // Создаем объект Alerta
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        // Создаем кнопку на Alerte с текстовым полем и сохранением сообщения
        let action = UIAlertAction(title: "OK", style: .default) { action in
            let humanInText = alertController.textFields?.first?.text
            self.hiLabel.text! += humanInText! + "!"
            
        }
        
        // Добавляем текс и кнопку на Alert
        alertController.addTextField { textfield in
            textfield.isSecureTextEntry = true
            
        }
        alertController.addAction(action)
        // Просим ViewController отобразить наш Alert
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}

