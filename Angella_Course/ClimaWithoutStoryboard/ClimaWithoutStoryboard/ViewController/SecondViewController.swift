//
//  SecondViewController.swift
//  ClimaWithoutStoryboard
//
//  Created by PavelM on 18/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit



class SecondViewController: UIViewController, ThrowTextDelegate {
    
    
    var text: String = ""
    
    func printText(text: String) {
        
        print("Работает делегат")
        self.text = text
    }
    
    
    
    
    let backButton = UIButton()
    var modelController: ModelController!
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Работает did load")

        view.backgroundColor = UIColor(patternImage: UIImage(named: "cityBackground")!)
        
        let viewWork = ViewWork.shared()
        
        viewWork.drawBackButtonSeconVC(button: backButton)
        
        view.addSubview(backButton)
        
        viewWork.placedBackButtonSeconVC(button: backButton, view: view)
        
        viewWork.drawTextLabel(label: label)
        
        view.addSubview(label)
        
        viewWork.placeLabelText(label: label, view: view)
        
        backButton.addTarget(self, action: #selector(onbackButton), for: .touchUpInside)
    }
    
    
    //После перехода к этому экрану сработает этот метод
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        print("Работает Will Appear")

//        label.text = modelController.text
        label.text = text

    }
    
    @objc func onbackButton() {
        
//        modelController.text  = "Вернулся на главный view"
        
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    


}
