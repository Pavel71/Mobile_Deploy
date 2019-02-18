//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by PavelM on 06/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var shareButton = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        createButton()
       
    }
    
    // MARK: - Method
    func createTextField() {
        
        textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        textField.center = view.center
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text to share"
        textField.delegate = self
        view.addSubview(textField)
        
    }
    
    func createButton() {
        
        shareButton = UIButton(type: .roundedRect)
        shareButton.frame = CGRect(x: 50, y: 350, width: 280, height: 50)
        shareButton.setTitle("Расшарить", for: .normal)
        
        shareButton.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        
        view.addSubview(shareButton)
        
        
    }
    
    @objc func handleShare(sender: UIButton) {
        
        let text = textField.text
        
        if text?.count == 0 {
            let message = "Сначало введите текст потом нажмите кнопку"
            
            let alertControl = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertControl.addAction(action)
           present(alertControl,animated: true,completion: nil)
        }
        
        activityViewController = UIActivityViewController(activityItems: [textField.text ?? "nil"], applicationActivities: nil)
        
        present(activityViewController!, animated: true, completion: nil)
        
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }


}

