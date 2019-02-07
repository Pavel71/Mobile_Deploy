//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by PavelM on 06/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    
    
    // Outlets place
    
    override func viewDidLoad() {
        super.viewDidLoad()

     let date = NSDate()
     datePicker.setDate(date as Date, animated: false)
        
    }
    

   
    
    
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        
        let message = "The date and time you selected is \(datePicker.date)"
        
        let alert = UIAlertController(title: "Date and Time Selected", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "That so true", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true,completion: nil)
    }
    
    
    
    // Action place
}
