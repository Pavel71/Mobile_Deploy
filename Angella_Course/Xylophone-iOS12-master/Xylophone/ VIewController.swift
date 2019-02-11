//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var myAudioPlayer : AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        
        
        guard let soundUrl = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav") else {return}
        
        
        do {
            
            myAudioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
            
            // Если уверне что ошибки не будет
            // try! myAudioPlayer = AVAudioPlayer(contentsOf: soundUrl)
        
        } catch {
            
            print(error.localizedDescription)
        }
        
        myAudioPlayer!.play()
        
        
        
        
    }
    
  

}

