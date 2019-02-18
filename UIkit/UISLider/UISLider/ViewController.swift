//
//  ViewController.swift
//  UISLider
//
//  Created by PavelM on 04/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // Outlet
    
    @IBOutlet var sliderBord: UISlider!
    
    var player = AVAudioPlayer()
    let slider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Slider из кода! Проще его делать из IB!
        self.slider.frame = CGRect(x: 0, y: 0, width: 200, height: 23)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        
        self.view.addSubview(self.slider)
        
        // addTarget
        self.slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        
        do {
            // Здесь нужно прописать путь к файлу GGG
            if let audiPath = Bundle.main.path(forResource: "GGG", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audiPath))
                self.slider.maximumValue = Float(player.duration)
            }
            
        } catch  {
            print("Error")
        }
        
//        self.player.play()

    }
    
    // MARK: Method
    @objc func changeSlider(sender: UISlider) {
        
        if sender == self.slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    // MARK: - Action
    @IBAction func sliderAction(_ sender: UISlider) {
        self.player.volume = self.sliderBord.value
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
        self.player.play()
    }
    

    @IBAction func pauseButton(_ sender: UIButton) {
        
        self.player.pause()
    }
}

