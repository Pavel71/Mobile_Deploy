//
//  CategoryTableViewController.swift
//  Todoye
//
//  Created by PavelM on 25/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//





/*
 
    Вообщем для обучения нужно прописать все разделы самостоятельно!
    Все делегаты, работу с базой данных, seque и тд!
 
 */

// 1. Создам категорию чтобы отображала все что есть в базе данных


import UIKit
import RealmSwift
import ChameleonFramework

class CategoryTableViewController: SwipeTableViewController {
    
    // Соединение с базой данных
    let realm = try! Realm()
    
    // Массив данных из БД
    // Авто обновление с постоянной регулярностью!
    var itemCategoryArray: Results<Category>?



    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategory()


    }


    // MARK: - Table view DATASOURCE and SwipeCellDelegaet
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCategoryArray?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = itemCategoryArray?[indexPath.row].name ?? "No category"
        
        
        cell.accessoryType = .disclosureIndicator
        // поставить цвет стрелочкам справа

        
        let image = UIImage(named:"arrow")

        let disclosureImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        disclosureImageView.image = image
        cell.accessoryView = disclosureImageView

        

        
        if let backgroundColorString = itemCategoryArray?[indexPath.row].backroundColor {
            
            guard let backgroundColor = UIColor(hexString: backgroundColorString) else {fatalError()}
            
            cell.backgroundColor = backgroundColor
            cell.textLabel?.textColor = ContrastColorOf(backgroundColor, returnFlat: true)
            
            
        }
        
        

        return cell
    }
    
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
//    }
    
    // MARK: - Table view DELEGATE
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // При нажатия на строку мы переходим ко всем продуктам этой категории

        // Осуществляю переход
        performSegue(withIdentifier: "goToTodoye", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToTodoye" {
            
            let itemVC = segue.destination as! TodoyeTableViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                itemVC.selectedCategory = self.itemCategoryArray?[indexPath.row]
            }

        }

    }
    
    //MARK: - ADD Button
    
    // При добавлении категории Создаем класси сохраняем изменени в БД
    @IBAction func addButton(_ sender: UIBarButtonItem) {

        var textFieldAlert = UITextField()
        
        // Вызовем Алерт с текстовым полем
        
        let controller = UIAlertController(title: "Новая категория", message: "Добавьте категорию", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Сохранить", style: .default) { (action) in
            
            let newCategory = Category()
            newCategory.name = textFieldAlert.text!
            newCategory.backroundColor = UIColor.randomFlat.hexValue()

            self.save(category: newCategory)
        }
        
        controller.addTextField { (textField) in
            textField.placeholder = "Название категории"
            textFieldAlert = textField
        }
        
        controller.addAction(action)
        
        present(controller,animated: true,completion: nil)

    }
    
 
    //# MARK: - SAVE and LOAD
    func save(category: Category) {

        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Saving data Error \(error)")
        }
        self.tableView.reloadData()
    }

    // Подгружаем все данные из таблички
    func loadCategory() {
        itemCategoryArray = realm.objects(Category.self)
        self.tableView.reloadData()
    }
    
    // MARK: - Delete and READ from Swipe
    override func deleteRow(at indexPath: IndexPath) {

        
        if let category = self.itemCategoryArray?[indexPath.row] {
            do {
                try self.realm.write {

                    self.realm.delete(category)
                }
            } catch {
                print("Delete Category Real Error \(error)")
            }
        }
    }
    
    override func readMore(at indexPath: IndexPath) {
        print("Push read More information")
    }
    
    
}







////////////////////// Core Data /////////////////////

//import UIKit
//import CoreData
//
//class CategoryTableViewController: UITableViewController {
//
//    // Массив данных из БД
//    var itemCategoryArray: [Category] = []
//
//
//    // Context Нашей БД
//
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        loadCategory()
//
//    }
//
//
//    // MARK: - Table view DATASOURCE
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemCategoryArray.count
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
//
//        cell.textLabel?.text = itemCategoryArray[indexPath.row].name
//
//        cell.accessoryType = .disclosureIndicator
//
//        return cell
//    }
//
//    // MARK: - Table view DELEGATE
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // При нажатия на строку мы переходим ко всем продуктам этой категории
//
//        // Осуществляю переход
//        performSegue(withIdentifier: "goToTodoye", sender: self)
//    }
//
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "goToTodoye" {
//
//            let itemVC = segue.destination as! TodoyeTableViewController
//
//            if let indexPath = tableView.indexPathForSelectedRow {
//
//                itemVC.selectedCategory = self.itemCategoryArray[indexPath.row]
//            }
//
//        }
//
//
//    }
//
//    //MARK: - ADD Button
//
//    // При добавлении категории Создаем класси сохраняем изменени в БД
//    @IBAction func addButton(_ sender: UIBarButtonItem) {
//
//
//        var textFieldAlert = UITextField()
//
//        // Вызовем Алерт с текстовым полем
//
//        let controller = UIAlertController(title: "Новая категория", message: "Добавьте категорию", preferredStyle: .alert)
//
//        let action = UIAlertAction(title: "Сохранить", style: .default) { (action) in
//
//            let newCategory = Category(context: self.context)
//            newCategory.name = textFieldAlert.text
//
//            self.itemCategoryArray.append(newCategory)
//
//            self.saveCategory()
//        }
//
//        controller.addTextField { (textField) in
//            textField.placeholder = "Название категории"
//            textFieldAlert = textField
//        }
//
//        controller.addAction(action)
//
//        present(controller,animated: true,completion: nil)
//
//
//    }
//
//
//    //MARK: SAVE and LOAD
//    // Сохраняем категории в БД
//
//    func saveCategory() {
//
//        do {
//
//            try context.save()
//
//        } catch {
//
//            print("Saving data Error \(error)")
//        }
//
//        self.tableView.reloadData()
//    }
//
//
//
//    // Подгружаем все данные из таблички
//    func loadCategory() {
//        // Возмем все что есть в табличке
//        let request: NSFetchRequest<Category> = Category.fetchRequest()
//
//        do {
//            // Положем все в наш массив Категорий
//            itemCategoryArray = try context.fetch(request)
//
//        }catch {
//
//            print("Request error \(error)")
//        }
//
//        self.tableView.reloadData()
//
//
//    }
//
//}



