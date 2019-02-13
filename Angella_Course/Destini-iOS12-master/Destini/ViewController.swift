//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   var storysDict = Storys().dictStorys
   var newStoryNumber = 1
    
    var restartButton: UIButton!
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.Нужно проинсталировать начальную историю на старте с ответами
        
        
        createRestartButton()
        
        initScreenNewStorys()
        
        
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        // Переключим новую историю
        switchStory(answer: sender.tag)
        
        // выведи новые данные на экран
        initScreenNewStorys()
    
    }
    

    
    // Метод Меняет номер новой истории
    func switchStory(answer: Int) {
        
        switch newStoryNumber {
            
            
        case 1 where answer == 1:
            
            newStoryNumber = 3
            
        case 1 where answer == 2:
            
            newStoryNumber = 2
            
        case 2 where answer == 1:

            newStoryNumber = 3
            
        case 2 where answer == 2:
            
            newStoryNumber = 4
            showRestartButton()
            
        case 3 where answer == 1:
            newStoryNumber = 6
            showRestartButton()
            
        case 3 where answer == 2:

            newStoryNumber = 5
            showRestartButton()
            
        default: break
            
            
        }
        
    }
    
    // Метод выводит на экран нужную исорию и правельные ответы на кнопки
    func initScreenNewStorys() {
        
        storyTextView.text = storysDict[newStoryNumber]?.story
        
        
        // Значит ответ есть
        if  let answerA = storysDict[newStoryNumber]?.answera, let answerB = storysDict[newStoryNumber]?.answerb {
            
            topButton.setTitle(answerA, for: .normal)
            bottomButton.setTitle(answerB, for: .normal)
            
        } else {
            
            topButton.isHidden = true
            bottomButton.isHidden = true
            
        }
    }
    
    
    func createRestartButton() {
        
        // Создадим кнопку с restartom
        restartButton = UIButton(frame: CGRect(x: 16, y: 515, width: 343, height: 50))
        
        restartButton.setTitle("Restart the Game!", for: .normal)
        restartButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        view.addSubview(restartButton)
        
        // Установим прослушку этой кнопки и при нажатие запусти метод
        restartButton.addTarget(self, action: #selector(onRestartButton), for: .touchUpInside)
        
        // Пока скроем
        restartButton.isHidden = true
    }
    
    func showRestartButton() {
        
        restartButton.isHidden = false
    }
    
    // При нажатие на кнопку вернуть все в исходную позицию!
    @objc func onRestartButton(target: UIButton) {
        
        newStoryNumber = 1
        
        
        restartButton.isHidden = true
        
        topButton.isHidden = false
        bottomButton.isHidden = false
        
        initScreenNewStorys()
    }



}

