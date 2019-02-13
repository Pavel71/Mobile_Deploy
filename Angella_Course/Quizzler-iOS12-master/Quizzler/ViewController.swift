//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    //Все вопросы
    let allQuestion = QuestionBank().list
    var pickAnswer: Bool!
 
    var countQuestion = 0
    var score = 0
    var allQuestionCount: Int!
    
    //Размещаем вопрос
    @IBOutlet weak var questionLabel: UILabel!
    // Очки
    @IBOutlet weak var scoreLabel: UILabel!
    //Прогресс
    @IBOutlet var progressBar: UIView!
    //Остаток
    @IBOutlet weak var progressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allQuestionCount = allQuestion.count
        //Кол-во попыток
        
        nextQuestion()
    }

    //Кнопочка с ответом
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        pickAnswer = sender.tag == 1 ? true : false
        
        checkAnswer()

    }

    func nextQuestion() {

        // Если еще не все вопросы заданы Поставь новый вопрос
        if countQuestion < allQuestionCount {
            
            questionLabel.text = allQuestion[countQuestion].questiontext
            
            updateUI()
            
 
        } else {
            
            // Не выводим следующий вопрос
            
            let message = "Ваш результат: \(score) из \(allQuestionCount!)"
            
            let controller = UIAlertController(title: "Конец игры", message: message, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Начинаем заново", style: .default, handler: startOver(target:))
            
            controller.addAction(action)
            present(controller,animated: true,completion: nil)

        }
        
        
        
    }
    
    
    func checkAnswer() {
        
        // Проверка ответа
        if allQuestion[countQuestion].answer == pickAnswer {
            
            score += 1
            // библиотечка с всплывабщим окошечком!
            ProgressHUD.showSuccess("Правильно")
            
        } else {ProgressHUD.showError("Ошибка")}
        
        // Вызывается следующий вопрос
        
        countQuestion += 1
        
        nextQuestion()
        
        
        
    }
    
    
    // Функция отвечает за возвращение всех результатов к изночальным!
    func startOver(target: UIAlertAction) {
        
        // Перед началом игры зануляем все очки и попытки

        
        self.score = 0
        self.countQuestion = 0
        
        self.updateUI()
        self.nextQuestion()
       
    }
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(countQuestion + 1)/\(allQuestionCount!)"
        
        progressBar.frame.size.width = (self.view.frame.size.width / 13) * CGFloat(countQuestion + 1)
        
        
    }
    

    
}
