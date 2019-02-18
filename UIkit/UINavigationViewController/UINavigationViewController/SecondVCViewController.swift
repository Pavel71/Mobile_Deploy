//
//  SecondVCViewController.swift
//  UINavigationViewController
//
//  Created by PavelM on 11/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class SecondVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "SecondVC"
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // после перехода ждет указанное время и запускает функцию!
        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    
   @objc func goBack() {
    // Возвращает экран на предыдущию View
        
//        self.navigationController?.popViewController(animated: true)
    
    // Получаем текущий массив контроллеров
    
    var currentControllerArrey = self.navigationController?.viewControllers
    
    // Удалить последний контроолер
    
    currentControllerArrey?.removeLast()
    
    if let newController = currentControllerArrey {
        
        self.navigationController?.viewControllers = newController
    }
    
    
    }
    

}
