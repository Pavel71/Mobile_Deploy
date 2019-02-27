//
//  AppDelegate.swift
//  Todoye
//
//  Created by PavelM on 22/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // Самый первый метод который загружает приложение
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
//        print(Realm.Configuration.defaultConfiguration.fileURL!)

        
        do {
            
            _ = try Realm()
  
        } catch {
            
            print("Realm Create error \(error)")
        }

        return true
    }
    


}

