//
//  ViewController.swift
//  Dicee
//
//  Created by PavelM on 08/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

// Задача для начала при нажатие кнопки Roll поменять картинки на случайные!

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var diceeImageOne: UIImageView!
    @IBOutlet var diceeImageTwo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRandomImage()
        
    }


    @IBAction func rollButton(_ sender: UIButton) {
        
        getRandomImage()
    }
    
    // motion detected
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        getRandomImage()
    }
    
    func getRandomImage() {
        
        let numb1 = Int.random(in: 1...6)
        let numb2 = Int.random(in: 1...6)
        
        diceeImageOne.image = UIImage(named: "dice\(numb1)")
        diceeImageTwo.image = UIImage(named: "dice\(numb2)")
    }
}

