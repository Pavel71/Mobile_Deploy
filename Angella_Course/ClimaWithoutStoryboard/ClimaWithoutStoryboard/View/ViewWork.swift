//
//  ViewWork.swift
//  ClimaWithoutStoryboard
//
//  Created by PavelM on 18/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewWork {

    
    static func shared() -> ViewWork {
        
        return ViewWork()
    }
    
    // Main Controller
    
    func drawTopButtonSwitch(button: UIButton) {
        
        let image = UIImage(named: "switch")
        button.setImage(image, for: .normal)
        
        
    }
    
    func placedTopButtonSwitch(button: UIButton,view: UIView) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        
    }
    
    func drawTextField(textField: UITextField) {
        
        let field = textField
        field.placeholder = "Что хотите передать!"
        field.adjustsFontForContentSizeCategory = true
        field.autocapitalizationType = .words
        field.borderStyle = .roundedRect
        
    }
    
    func placeTextField(textField: UITextField,view: UIView) {
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        
    }
    
    
    // Second Controller
    func drawBackButtonSeconVC(button: UIButton) {
        
        let image = UIImage(named: "left")
        button.setImage(image, for: .normal)
        
        
    }
    
    func placedBackButtonSeconVC(button: UIButton,view: UIView) {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
    }
    
    func drawTextLabel(label: UILabel) {
        
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont(name: .init(), size: 30)
        label.numberOfLines = 2
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    
    func placeLabelText(label: UILabel, view: UIView) {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    

}
