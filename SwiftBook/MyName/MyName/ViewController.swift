//
//  ViewController.swift
//  MyName
//
//  Created by PavelM on 31/01/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var label: UILabel!
    
    @IBAction func changeLabelText(_ sender: UIButton) {
        label.text = ("The \(sender.titleLabel!.text!.lowercased())button was pressed")
    }
    
    // Action от нажатия кнопки!
    @IBAction func showMessage(_ sender: UIButton) {
        
        // Всплывающее окно! Экземпляр класса!
        let alertController = UIAlertController(title: "Alert", message: "Text of alert",preferredStyle: UIAlertController.Style.alert)
        // добавим кнопки всплывающему окну
        
        alertController.addAction(UIAlertAction(title: "First", style:
            UIAlertAction.Style.default, handler: nil))
        
        alertController.addAction(UIAlertAction(title: "Second", style:
            UIAlertAction.Style.default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
//         print("You push Button!")
    }
    
    
    
    


    
    

}

