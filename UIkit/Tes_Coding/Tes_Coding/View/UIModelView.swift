//
//  UIModelView.swift
//  Tes_Coding
//
//  Created by PavelM on 18/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class UIModelView: UIViewController {


    // MARK: - UILabel
    
    // Метод добавляет атрибуты к Lable
    func drawLabel(newLabel: UILabel, newTextLabel: String) {

//        newLabel.frame = CGRect(x: 20, y: 80, width: 250, height: 80)
        newLabel.text = newTextLabel
        newLabel.numberOfLines = 2
        newLabel.lineBreakMode = .byWordWrapping
        newLabel.textAlignment = .center
        newLabel.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        
        
        // Попробую сразуже настроить констраинты
        
    }
    
    //MARK: - UIButton
    
    func drawButton(newButton: UIButton, textButton: String, backgroundButton: UIColor) {
        
        newButton.backgroundColor = backgroundButton
        newButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        newButton.setTitle(textButton, for: .normal)

        
    }
    

    
    //MARK: - UIView
    
    func drawView(newView: UIView, newViewBackgroundColor: UIColor, isClipBounds: Bool, isCornerRadis:CGFloat) {
        
//        newView.frame = CGRect(x: 20, y: 110, width: 280, height: 300)
        newView.backgroundColor = newViewBackgroundColor
        newView.clipsToBounds = isClipBounds
        newView.layer.cornerRadius = isCornerRadis
        
    }


}
