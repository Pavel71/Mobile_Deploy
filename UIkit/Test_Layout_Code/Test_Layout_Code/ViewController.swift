//
//  ViewController.swift
//  Test_Layout_Code
//
//  Created by PavelM on 13/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let viewRed: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
        return view
    }()
    
    let viewBlue: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        return view
    }()
    
    let viewGreen: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        return view
    }()
    
        

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(viewRed)
        view.addSubview(viewBlue)
        view.addSubview(viewGreen)
        
//        vflTest()
        
        createViewRedConstraint()
        createViewBlueConstraint()
        createViewGreenConstraint()
        
       
    }
    
    func vflTest() {
        
        // Язык визуального форматирования VFL
        
        let viewVFL = ["viewRed": viewRed, "viewBlue": viewBlue]
        let metrics = ["height": 100, "width": view.bounds.size.width / 3,"top": view.bounds.size.height / 2]
        
        
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[viewRed(height)]|", options: [], metrics: metrics, views: viewVFL))
        
        view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-top-[viewBlue(height)]|",
            options: [],
            metrics: metrics,
            views: viewVFL))
        
        view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[viewBlue(width)]-(50)-[viewRed(width)]-|",
            options: [],
            metrics: metrics,
            views: viewVFL))
    }
    
    // NSLayoutAnchor - Якоря
    
    func createViewRedConstraint() {
        
        viewRed.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        viewRed.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        viewRed.heightAnchor.constraint(equalToConstant: 100).isActive = true
        viewRed.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func createViewBlueConstraint() {
        
        viewBlue.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        viewBlue.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        viewBlue.heightAnchor.constraint(equalToConstant: 100).isActive = true
        viewBlue.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
    }
    
    func createViewGreenConstraint() {
        
        viewGreen.rightAnchor.constraint(equalTo: viewBlue.rightAnchor).isActive = true
        
        viewGreen.leftAnchor.constraint(equalTo: viewRed.leftAnchor).isActive = true
        
        viewGreen.bottomAnchor.constraint(equalTo: viewRed.topAnchor, constant: -20).isActive = true
        
        viewGreen.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Супер древний метод
    
//    func createView1Constraint() {
//
//
//
//        //Left
//        NSLayoutConstraint(item: view1,
//                           attribute: .centerX,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .centerX,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//
//        //Right
//        NSLayoutConstraint(item: view1,
//                           attribute: .centerY,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .centerY,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//        // Отступ от верха
//        NSLayoutConstraint(item: view1,
//                           attribute: .width,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: 200).isActive = true
//        // отступ снизу
//        NSLayoutConstraint(item: view1,
//                           attribute: .height,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: 200).isActive = true
//
////        // Ширина и высота
////        NSLayoutConstraint(item: view1,
////                           attribute: .height,
////                           relatedBy: .equal,
////                           toItem: view,
////                           attribute: .width,
////                           multiplier: 1,
////                           constant: 0).isActive = true
//
//
//    }
//
//    func createView2Constraint() {
//
//        // Супер древний метод
//
//        //Left
//        NSLayoutConstraint(item: view2,
//                           attribute: .centerX,
//                           relatedBy: .equal,
//                           toItem: view1,
//                           attribute: .centerX,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//
//        //Right
//        NSLayoutConstraint(item: view2,
//                           attribute: .bottom,
//                           relatedBy: .equal,
//                           toItem: view1,
//                           attribute: .top,
//                           multiplier: 1,
//                           constant: -8).isActive = true
//
//        // Отступ от верха
//        NSLayoutConstraint(item: view2,
//                           attribute: .width,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: 100).isActive = true
//        // отступ снизу
//        NSLayoutConstraint(item: view2,
//                           attribute: .height,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: 100).isActive = true
//
//
//    }
//

}

