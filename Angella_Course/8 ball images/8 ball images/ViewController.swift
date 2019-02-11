//
//  ViewController.swift
//  8 ball images
//
//  Created by PavelM on 08/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ballImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        let randomAnswer = Int.random(in: 1...5)
        
        ballImage.image = UIImage(named: "ball\(randomAnswer)")
    }
    
    
    
}

