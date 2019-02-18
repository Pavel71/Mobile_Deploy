//
//  ViewController.swift
//  Tes_Coding
//
//  Created by PavelM on 18/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = UIModelView()
    var mylabel = UILabel()
    var mylabel2 = UILabel()
    var mylabel3 = UILabel()
    var myView = UIView()
    var myButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        
        model.drawView(newView: myView, newViewBackgroundColor: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), isClipBounds: false, isCornerRadis: 0)
        
        
        view.addSubview(myView)
        
       placeView()
        
        
        
        model.drawLabel(newLabel: mylabel, newTextLabel: "Первый Контроллер")
        view.addSubview(mylabel)
        placeLabel1()
        
        model.drawLabel(newLabel: mylabel2, newTextLabel: "Второй контроллер")
        view.addSubview(mylabel2)
        placeLabel2()
        
        
        // Разместим Label3 отталкиваясь от label2
        model.drawLabel(newLabel: mylabel3, newTextLabel: "Третий контроллер")
        view.addSubview(mylabel3)
        placeLabel3()
        
        model.drawButton(newButton: myButton, textButton: "Нажми", backgroundButton: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))
        view.addSubview(myButton)
        
        placeButton()
        
        myButton.addTarget(self, action: #selector(start), for: .touchUpInside)
    }
    
    
    @objc func start() {
        
        let vc2 = ViewController2()
        self.navigationController?.pushViewController(vc2, animated: true)
        
    }
    
    func placeView() {
        // Размести View
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        myView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        myView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        myView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    func placeButton() {
        
        // Разместим кнопку как нам надо
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        myButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func placeLabel1() {
        
        // Разместим label1 как требуется
        mylabel.translatesAutoresizingMaskIntoConstraints = false
        mylabel.topAnchor.constraint(equalTo: myView.topAnchor, constant: 20).isActive = true
        mylabel.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 20).isActive = true
        mylabel.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -20).isActive = true
        
    }
    
    func placeLabel2() {
        
        // Разместим Label2 отталкиваясь от label1
  
        mylabel2.translatesAutoresizingMaskIntoConstraints = false
        
        mylabel2.topAnchor.constraint(equalTo: mylabel.bottomAnchor, constant: 20).isActive = true
        mylabel2.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 20).isActive = true
        //        mylabel2.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -20).isActive = true
        mylabel2.heightAnchor.constraint(equalToConstant: 70).isActive = true
        mylabel2.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 1/2.5).isActive = true
        
    }
    
    func placeLabel3() {
        
        mylabel3.translatesAutoresizingMaskIntoConstraints = false
        
        mylabel3.topAnchor.constraint(equalTo: mylabel.bottomAnchor, constant: 20).isActive = true
        //        mylabel2.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 20).isActive = true
        mylabel3.rightAnchor.constraint(equalTo: myView.rightAnchor, constant: -20).isActive = true
        mylabel3.heightAnchor.constraint(equalToConstant: 70).isActive = true
        mylabel3.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 1/2.5).isActive = true
    }


}

