//
//  YelloViewController.swift
//  ThreeViews
//
//  Created by PavelM on 06/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class YelloViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func yellowButtonPressed(sender: UIButton) {
        
        let alert = UIAlertController(title: "Yellow View Button pressed", message: "You pressed the button on the yellow view", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Yes i did", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
