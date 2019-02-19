//
//  ViewController.swift
//  Test_Navigator_Controll
//
//  Created by PavelM on 15/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let secondViewString = "SecondView"

    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    // При нажатие на кнопку перейти на новый контроллер
    // Это немного по запутанне чем просто перетащить от кнопки к контроллеру!
    @IBAction func onButtonChangView(_ sender: UIButton) {
        
        performSegue(withIdentifier: secondViewString, sender: self)
    }
    
    // Теперь сделаю так чтобы написанные строки на первом контроллере отображались на втором
    
    // Метод который сделает все что написанно прежде чем подгрузит следующий контроллер
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // проверка на какйо контроллер переключать
        if segue.identifier == secondViewString {
            
            // Получаем secondView
            let destination = segue.destination as! SecondViewController
            
            
            // Работаем с его свойствами и перед загрузкой можно брать его свойства!
            destination.labelText = textField.text!
            
            
            
        }
        
    }
    
    
}

