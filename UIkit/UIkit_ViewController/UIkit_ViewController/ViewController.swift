//
//  ViewController.swift
//  UIkit_ViewController
//
//  Created by PavelM on 01/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Method
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    // Этот метода основной! Какоето время мы расставляем все Вьюшки
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        hello()
    }
    
    // Здесь уже после Didload показывается экран Юзеру
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    // MARK: - func
    func hello() {
        
        print("Hello")
    }


}

