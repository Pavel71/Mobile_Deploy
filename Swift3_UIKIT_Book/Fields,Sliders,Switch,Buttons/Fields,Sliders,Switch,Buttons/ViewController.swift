//
//  ViewController.swift
//  Fields,Sliders,Switch,Buttons
//
//  Created by PavelM on 05/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet var nameField: UITextField!
    @IBOutlet var numberField: UITextField!
    @IBOutlet var sliderlabel: UILabel!
    
    @IBOutlet var doSomethingButton: UIButton!
    
    
    @IBOutlet var rightSwitch: UISwitch!
    @IBOutlet var leftSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        sliderlabel.text = "50"
    }
    
    // MARK: Fields Done
    @IBAction func textFieldDoneEditing(_ sender: UITextField){
        
        sender.resignFirstResponder()
        
    }
    
    // MARK: TAP Screen
    @IBAction func onTapGestureRecognized(_ sender: UITapGestureRecognizer) {
        
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    
    // MARK: Slider
    @IBAction func numberSlider(_ sender: UISlider) {
        sliderlabel.text = String(lround(Double(sender.value)))
    }
    // MARK: Switch
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
        
    }
    
    // MARK: DoubleController
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 { // switches
            
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            doSomethingButton.isHidden = true
            
        } else {
            
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            doSomethingButton.isHidden = false
        }
        
    }
    
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let controller = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes I'm sure!", style: .destructive, handler: {action in
            
            // тернарный оператор
            let msg = self.nameField.text!.isEmpty ? "You can breathe easy, everything went OK" : "You can breathe easy, \(self.nameField.text!)" + "everything went OK"
            
            let controller2 = UIAlertController(title: "Something was Done", message: msg, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title:"Phew!", style: .cancel, handler: nil)
            
            controller2.addAction(cancelAction)
            self.present(controller2, animated: true,completion: nil)
            
        })
        
        let noAction = UIAlertAction(title: "No Way!", style: .cancel, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        
        present(controller, animated: true, completion: nil)
        
        
        
    }
        
        
}

