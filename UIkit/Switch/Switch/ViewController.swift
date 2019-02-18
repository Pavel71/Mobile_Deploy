//
//  ViewController.swift
//  Switch
//
//  Created by PavelM on 04/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mySwitch = UISwitch()
    let mySwitch2 = UISwitch()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /////////// Switch_2 ///////////////
        
        /////// Add Button //////
        self.button.frame = CGRect(x: 200, y: 300, width: 200, height: 100)
        self.button.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        self.button.setTitle("Ok", for: .normal)
        self.button.setTitle("Кнопка нажата", for: .highlighted)
        
        
        self.mySwitch2.frame = CGRect.zero
        
        self.mySwitch2.center = self.view.center
        
        // Добавить элементы на View
        self.view.addSubview(self.mySwitch2)
        self.view.addSubview(self.button)
        
        // of
        self.mySwitch2.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        // button
        self.mySwitch2.thumbTintColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        // on
        self.mySwitch2.onTintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
        
        self.mySwitch2.addTarget(self, action: #selector(switchOn(target:)), for: .valueChanged)

        
        
        ///// Switch_1 ////////
        
//        // Switch create
//        self.mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
//        self.view.addSubview(self.mySwitch)
//
//        // On
//        self.mySwitch.setOn(true, animated: true)
//
//        // Проверка
//        if self.mySwitch.isOn {
//
//            print("Switch On")
//        } else {print("Switch Off")}
//
//
//        // Повесили наблюя за switch и не нужно организовывать цикл! Очень круто!
//        self.mySwitch.addTarget(self, action: #selector(switchStartWork(paramTarget:)), for: .valueChanged)
    }
    
    ////// Switch_2 ///////
    
    
    @objc func switchOn(target: UISwitch) {
        
        var flag = true
        
        if target.isOn {
            // взаимодействие Юзера с кнопкой
            flag = false
        }
        self.button.isUserInteractionEnabled = flag
    }
    
    ///// Switch_1 ////////
    
    
    
//    @objc func switchStartWork(paramTarget : UISwitch) {
//
//
//        if paramTarget.isOn {
//
//            print("Switch On")
//        } else {print("Switch Off")}
//
//
//    }


}

