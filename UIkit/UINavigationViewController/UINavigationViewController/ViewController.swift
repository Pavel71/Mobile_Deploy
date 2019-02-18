//
//  ViewController.swift
//  UINavigationViewController
//
//  Created by PavelM on 11/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displaySecondButton = UIButton()
    
    
    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Слева поставим switch
        
        let simpleSwitch = UISwitch()
        simpleSwitch.isOn = true
        simpleSwitch.addTarget(self, action: #selector(onSwitch(param:)), for: .valueChanged)
        
        
        
        // Добавить навигационную кнопку!
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera
            , target: self, action: #selector(onCamera(sender: )))
        // Добавить Switch
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: simpleSwitch)
        
        
        createImageTitleView()
//
        
//        self.title = "FirstVC"
        
        displaySecondButton = UIButton(type: .system)
        displaySecondButton.setTitle("SecondVC", for: .normal)
        displaySecondButton.sizeToFit()
        displaySecondButton.center = view.center
        displaySecondButton.addTarget(self, action: #selector(onButton), for: .touchUpInside)
        view.addSubview(displaySecondButton)
        
    }
    @objc func onSwitch(param: UISwitch) {
        
        
        if param.isOn {
            
            print("Switch ON")
        } else {
            print("Switch Off")
        }
    }
    
    @objc func onCamera(sender: UIBarButtonItem) {
        
        print("Camera")
    }
    
    fileprivate func createImageTitleView() {
        // Помести фото вместо title в навигатор бар
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "будильник")
        
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    @objc func onButton(sender: UIButton) {
        
        let secondVC = SecondVCViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }


}

