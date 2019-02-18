//
//  ViewControllerTwo.swift
//  UIkit_ViewController
//
//  Created by PavelM on 01/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    // MARK: Properties
    var a: String?
    var b: String?
    
    @IBOutlet weak var statusLabel : UILabel!
    
    @IBAction func someButton(_ sender: UIButton) {
        
  
        let title = sender.title(for : . selected)!
        let text = "\(title) button pressed"
        let styledText = NSMutableAttributedString(string: text)
        
        let attributes = [
            NSAttributedString.Key.font :
                UIFont.boldSystemFont(ofSize: statusLabel.font.pointSize)
        ]
        
        let nameRange = (text as NSString).range(of: title)
        styledText.setAttributes(attributes,range : nameRange)
        statusLabel.attributedText = styledText
    
    }
    // MARK: Method
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad")
        
    }
    


}
