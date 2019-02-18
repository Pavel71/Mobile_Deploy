//
//  ViewController.swift
//  UISegmentControll
//
//  Created by PavelM on 06/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentControl = UISegmentedControl()
    var imageView = UIImageView()
    var menuArray = ["one","two","three"]
    var imageArray = [
                       UIImage(named:"Green_ball.png"),
                       UIImage(named:"Yellow_ball.png"),
                       UIImage(named: "Red_ball.png")
                     ]
    
    var frameSemafor = CGRect(x: 150, y: 400, width: 100, height: 100)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // image
        imageView.frame = frameSemafor
        imageView.image = imageArray[0]
        
        view.addSubview(imageView)
        
        
        // Create segment
        segmentControl = UISegmentedControl(items: menuArray)
        segmentControl.frame = CGRect(x: 100, y: 500, width: 200, height: 50)
        segmentControl.selectedSegmentIndex = 0
        view.addSubview(segmentControl)
        
        segmentControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        
        
        
    }
    
    @objc func selectedValue(target: UISegmentedControl) {
        
        if target == segmentControl {
            
            let segmentIndex = target.selectedSegmentIndex
            
            imageView.image = imageArray[segmentIndex]

            
            // Здесь я пытаюсь отобразить в виде светафора!
            switch segmentIndex {
            
            case 0:
                frameSemafor = CGRect(x: 150, y: 400, width: 100, height: 100)
            case 1:
                frameSemafor = CGRect(x: 150, y: 300, width: 100, height: 100)
            case 2:
                frameSemafor = CGRect(x: 150, y: 200, width: 100, height: 100)
            default:
                break
            }
            imageView.frame = frameSemafor
            
            // text
//            target.titleForSegment(at: 0)
            
            
        }
    }


}

