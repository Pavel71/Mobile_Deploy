//
//  ViewController.swift
//  ClimaWithoutStoryboard
//
//  Created by PavelM on 18/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//


// В принципе все работает через ModelControll

// Теперь сделаю тоже самое через Delegate
import UIKit

protocol ThrowTextDelegate {
    
    
    func printText(text:String)
}

class MainViewController: UIViewController {
    
    var delegate: ThrowTextDelegate?
    
    

    
    let topSwitchButton = UIButton()
    let textField = UITextField()
    
    var modelController : ModelController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Добавляем картинку на background
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        let viewWork = ViewWork.shared()
        
        viewWork.drawTopButtonSwitch(button: topSwitchButton)
        
        view.addSubview(topSwitchButton)
        
        viewWork.placedTopButtonSwitch(button: topSwitchButton, view: view)
        
        viewWork.drawTextField(textField: textField)
        view.addSubview(textField)
        viewWork.placeTextField(textField: textField, view: view)
        
        topSwitchButton.addTarget(self, action: #selector(onTopSwitchButton), for: .touchUpInside)

        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc func onTopSwitchButton() {
        

        if let text = textField.text {
            
            
            modelController.text = text
        } else {
            
            modelController.text = ""
            
        }

        let vc2 = SecondViewController()
        
        
        // прежде чем перейти на следующую вью я уже сейчас могу работать с его свойствами и методами используя данные текущего View!
        
        // Здесь я получаю протоколные свойства которые могу применить в View2 но также могу задействовать любые данные из View1
        delegate = vc2
        delegate?.printText(text: textField.text!)
        
        
        // передаем ссылку на контроллер во вторую вьюшку и все изменения там будут и здесь
//        vc2.modelController = modelController
        
        self.navigationController?.pushViewController(vc2, animated: true)
        
        
    }
    
    
    
    
    
    
    


}

