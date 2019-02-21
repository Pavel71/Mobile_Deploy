//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import ProgressHUD
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {

        SVProgressHUD.show()
        //TODO: Log in the user
        // Передаем по методу юзера и пароль! После проверки метод нам же возвращает 2 параметра данные по юзеру и ошибку еслиона есть в Clousere мы с этими данными работаем!
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if error != nil {
                
                print(error.debugDescription)
            } else {
                
                SVProgressHUD.dismiss()
                ProgressHUD.showSuccess()
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
        
    }
    


    
}  
