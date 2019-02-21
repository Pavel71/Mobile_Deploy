//
//  ViewController.swift
//  Flash Chat
//
//  Created by Angela Yu on 29/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
  
    
    
    // Declare instance variables here
    var messageArray: [Message] = []
    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set yourself as the delegate and datasource here:
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
        //TODO: Set yourself as the delegate of the text field here:
        
        messageTextfield.delegate = self

        
        
        //TODO: Set the tapGesture here:
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        

        //TODO: Register your MessageCell.xib file here:
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        
      

        
        configureTableView()
        
        retriveMessage()
        
        messageTableView.separatorStyle = .none
        
        
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    
 
    // Метода определяющий формат Ячеек! Нужно подписать на ячейку дизайн
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderUsername.text = messageArray[indexPath.row].sender
        cell.avatarImageView.image = UIImage(named: "egg")
        
        if cell.senderUsername.text == Auth.auth().currentUser?.email as String! {
            
            // Message self sells
            cell.avatarImageView.backgroundColor = UIColor.flatBlue()
            cell.messageBackground.backgroundColor = UIColor.flatCoffee()
        } else {
            
            cell.avatarImageView.backgroundColor = UIColor.flatRed()
            cell.messageBackground.backgroundColor = UIColor.flatGray()
            
        }
        
        return cell
    }
    
    
    
    //TODO: Declare numberOfRowsInSection here:
    // метод возвращает кол-во строк в секторе
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messageArray.count
    }
    

    
    //TODO: Declare tableViewTapped here:
    @objc func tableViewTapped() {
        messageTextfield.endEditing(true)
        
    }
    
    
    //TODO: Declare configureTableView here:
    func configureTableView() {
        
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    //TODO: Declare Push Done Button
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.sendPressed(NSObject.self)
        return true
    }

    
    //TODO: Declare textFieldDidBeginEditing here:
    
    // Метод которые отработает перед началом ввода текста!(Открыть клаву)
    func textFieldDidBeginEditing(_ textField: UITextField) {

        
        // Добавим анимацию
        UIView.animate(withDuration: 0.5) {
            
            self.heightConstraint.constant = 308
            // Этот метод заставляет view обновить все контсраинты
            self.view.layoutIfNeeded()
        }
    }
    
    
    //TODO: Declare textFieldDidEndEditing here:
    // Метод который отработает после того как текст будет введен(Закрыть клаву)
    func textFieldDidEndEditing(_ textField: UITextField) {

        // Добавим анимацию
        UIView.animate(withDuration: 0.5) {
            
            self.heightConstraint.constant = 50
            // Этот метод заставляет view обновить все контсраинты
            self.view.layoutIfNeeded()
        }
        
    }
    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    
    
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        
        messageTextfield.endEditing(true)
        
        //TODO: Send the message to Firebase and save it in our database
        
        messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        
        // Создаем блок - категорию для базы данных
        // Посути это ссылка куда положим данные
        let messageDB = Database.database().reference().child("Messages")
        
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email,
                                 "Message": messageTextfield.text!]
        
        // Создаеи уникальный идентификатор и передаем Словарь с данными
        // В Замыкании проверяем все ли норм
        messageDB.childByAutoId().setValue(messageDictionary) { (error, reference) in
            
            if error != nil {
                
                print("Ошибка")
            } else {
                
                print("Message Save in DataBase" )
                self.messageTextfield.isEnabled = true
                self.sendButton.isEnabled = true
                self.messageTextfield.text = ""
            }
            
            
            
        }
        
        
        
    }
    
    //TODO: Create the retrieveMessages method here:
    
    // Достаем данные если они поступили в категорию в нашей DataBase
    func retriveMessage() {
        
        let messageDB = Database.database().reference().child("Messages")
        
        messageDB.observe(.childAdded) { (snapShot) in
            
            let snapShotValue = snapShot.value as! Dictionary <String,String>
            
            let message = snapShotValue["Message"]!
            let sender = snapShotValue["Sender"]!

            
            let newMessage = Message(sender: sender, messageBody: message)
            
            self.messageArray.append(newMessage)
            
            self.configureTableView()
            self.messageTableView.reloadData()
            
        }
        
        
    }
    
    

    
    
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        //TODO: Log out the user and send them back to WelcomeViewController
        do {
            
            try Auth.auth().signOut()
            
            self.navigationController?.popToRootViewController(animated: true)
            
        } catch {
            print("Something went wrong! ")
            
        }
    }
    


}
