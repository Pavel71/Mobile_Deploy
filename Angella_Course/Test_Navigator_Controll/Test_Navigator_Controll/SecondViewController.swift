//
//  SecondViewController.swift
//  Test_Navigator_Controll
//
//  Created by PavelM on 15/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var labelText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        label.center = view.center
        label.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.text = labelText
        label.textAlignment = .center
        label.font = UIFont(descriptor: .init(), size: 30)
        
        view.addSubview(label)
        

    }
    


    

}
