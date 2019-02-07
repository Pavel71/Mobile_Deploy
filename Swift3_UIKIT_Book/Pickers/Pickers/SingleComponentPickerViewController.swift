//
//  SingleComponentPickerViewController.swift
//  Pickers
//
//  Created by PavelM on 06/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit






class SingleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    @IBOutlet var singlePicker: UIPickerView!
    
    private let characterNames = [
    "Luka", "Leia","Han","Chewbacca", "Artoo","Threepio","Lando"]
    
    // Outlet place

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    

    @IBAction func onButtonPressed(_ sender: UIButton) {
        let row = singlePicker.selectedRow(inComponent: 0)
        let selected = characterNames[row]
        let title = "You selected \(selected)!"
        
        let alert = UIAlertController(title: title, message: "Thank you for choosing", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "You are wlcom", style: .default, handler: nil)
        
        alert.addAction(action)
        
        self.present(alert, animated: true,completion: nil)
        
    }
    
    // Action place
    
    
    // MARK:-
    //MARK: Picker Data Source Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView (_ pickerView : UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return characterNames.count
    }
    // MARK : Picker Delegate Methods
    func pickerView (_ pickerView: UIPickerView, titleForRow row: Int,
    forComponent component : Int ) -> String? {
        
        return characterNames[row]
    }
    
    
}
