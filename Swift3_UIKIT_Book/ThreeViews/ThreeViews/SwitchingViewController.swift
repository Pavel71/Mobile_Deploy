//
//  ViewController.swift
//  ThreeViews
//
//  Created by PavelM on 06/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit


// I want to do work about my last lesson!
// It's AlertController, AutoLayaut

class SwitchingViewController: UIViewController {
    
    private var blueViewController: BlueViewController!
    private var yellowViewController: YelloViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // Дополнительная настройка после заргузки
        
        blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as? BlueViewController
        
        blueViewController.view.frame = view.frame
        
        // Метод устанавливающий нужный контроллер и удаляющий из памяти предыдущий
        switchViewController(from: nil, to: blueViewController)
        
    }
    
    // MARK: switchViewsbutton
    @IBAction func switchViews(sender: UIBarButtonItem) {
        
        // Set properties in GeneralViews
        if yellowViewController?.view.superview == nil {
            
            if yellowViewController == nil {
                
                yellowViewController = storyboard?.instantiateViewController(withIdentifier: "Yellow") as? YelloViewController
            }
            
        } else if blueViewController?.view.superview == nil {
            
            if blueViewController == nil {
                blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as? BlueViewController
            }
        }
        
        // Анимация смены View
        UIView.beginAnimations("View Flip",context : nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        
        
        // После того как определил что у нас стоит меняем!
        
        if blueViewController != nil && blueViewController!.view.superview != nil {
            
            UIView.setAnimationTransition(.flipFromRight,
                                             for: view, cache: true)
            
            yellowViewController.view.frame = view.frame
            switchViewController(from: blueViewController, to: yellowViewController)
            
        } else {
            
            UIView.setAnimationTransition(.flipFromLeft,
                                              for: view, cache: true)

            blueViewController.view.frame = view.frame
            
            switchViewController(from:yellowViewController, to: blueViewController)
        }
        UIView.commitAnimations()
        
    }
    
    override func didReceiveMemoryWarning()  {
        super.didReceiveMemoryWarning()
    // Освобождаем возобновляемые ресурсы Это когда мы перешли с одного View на другое, последний нам не нужен и мы удаляем его из памяти
        
        if blueViewController != nil && blueViewController!.view.superview == nil {
            
            blueViewController = nil
        }
        
        if yellowViewController != nil && yellowViewController!.view.superview == nil {
            
            yellowViewController = nil
        }
    
    }
    
    private func switchViewController(from fromVC: UIViewController?, to toVC: UIViewController?) {
        
        if fromVC != nil {
            
            fromVC!.willMove(toParent: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParent()
        }
        
        if toVC != nil {
            self.addChild(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParent: self)
        }
        
    }

}

