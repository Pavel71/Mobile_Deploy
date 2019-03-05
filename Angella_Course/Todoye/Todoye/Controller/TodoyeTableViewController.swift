//
//  ViewController.swift
//  Todoye
//
//  Created by PavelM on 22/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class TodoyeTableViewController: SwipeTableViewController {
    
    
    @IBOutlet var searchBarOutlet: UISearchBar!
    
    @IBOutlet var addItemButton: UIBarButtonItem!

    var categoryItemsString: String!
    
    
    // MARK: - CategoryObject
    var selectedCategory: Category? {
        
        didSet {
            
            categoryItemsString = selectedCategory!.name
            loadItems()
            
        }
        
    }
    
    // Здесь я попробую сделать через класс
    
    var itemExemplArray: Results<Item>?
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
    }
    
    // Самый последний метода перед показом экрана! Здесь Навигатор уже подгружен
    override func viewWillAppear(_ animated: Bool) {
        
        title = categoryItemsString
        
        
        
        guard let colorHex = selectedCategory?.backroundColor else {fatalError()}
        
        updateSearchBar(withHexCode: colorHex)
        updateNavBar(withHexCode: colorHex)
    }
    
    // перед тем как вернутся на другой экран
    override func viewWillDisappear(_ animated: Bool) {
        
//        guard let originalColor = UIColor(hexString: "1D9BF6") else {fatalError()}
        
        updateNavBar(withHexCode: "1D9BF6")
        
    }
    
    // MARK: - Nav Bar Methods
    
    func updateNavBar(withHexCode colorHex: String) {
        
        
        guard let navBar = navigationController?.navigationBar else {fatalError("FatalController does not exist.")}
       
        
        guard let navBarColor = UIColor(hexString: colorHex) else {fatalError()}
        // Вредная полосечка
            
        navBar.barTintColor = navBarColor
        navBar.tintColor = ContrastColorOf(navBarColor, returnFlat: true)
        navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: ContrastColorOf(navBarColor, returnFlat: true)]
        
    }
    
    func updateSearchBar(withHexCode colorHex: String) {
        
        // Вредная полосечка вокруг Searchbar
        searchBarOutlet.layer.borderWidth = 1
        searchBarOutlet.layer.borderColor = UIColor(hexString: colorHex)!.cgColor
        navigationController?.hidesNavigationBarHairline = true
        searchBarOutlet.barTintColor = UIColor(hexString: colorHex)
        
    }
    
 
    //MARK: - TableViewDataSource Methods
    
    
    // Сколько строчек в секторе
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return itemExemplArray?.count ?? 1
    }
    
    // Какой тип ячейки отобразить
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
       
        if let item = itemExemplArray?[indexPath.row] {
            
            cell.textLabel?.text = item.value
            
            cell.accessoryType = item.done ? .checkmark : .none

            // С черным цветом это не работает!
            if let color = UIColor(hexString: selectedCategory!.backroundColor!)!.darken(byPercentage: CGFloat(indexPath.row) / CGFloat(itemExemplArray!.count)) {
                
                cell.backgroundColor = color
                cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
            }
            
            
        } else {
            
            cell.textLabel?.text = "No Items Added"
        }

        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    // Срабатывает когда мы выбираем строку
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Update data Realm
        
        if let item = itemExemplArray?[indexPath.row] {
            
            do {
                
                try realm.write {

                    item.done = !item.done
                }
                
            } catch {
                print("Realm Update Done Error \(error)")
            }

        }

        // Снять выбор со строчки
        tableView.deselectRow(at: indexPath, animated: true)
        // Зовем метод cellForRowAt
        tableView.reloadData()
    }
    

    @IBAction func addNewItem(_ sender: UIBarButtonItem) {

        var nameTextField = UITextField()

        // при нажате на + Добавим новые данные в таблицу! Используем Алерт Контроллер

        let controller = UIAlertController(title: "Добавим в таблицу", message: "Напишите задание", preferredStyle: .alert)

        // 2 По нажатию кнопку запускается это замыкание
        let action = UIAlertAction(title: "Добавить", style: .default) { (action) in
            
            if let currentCategory = self.selectedCategory {
                
                do {
                    
                    try self.realm.write {
                        
                        
                        let item = Item()
                        item.value = nameTextField.text!
                        item.dateCreated = Date()

                        currentCategory.itemList.append(item)
                    }
                    
                } catch {
                    
                    print("Ошибка \(error)")
                }

            }
            
            self.tableView.reloadData()

        }

        // 1 Создается поле в контроллере Название продукта
        controller.addTextField { (controllerTextField) in
            controllerTextField.placeholder = "Название продукта"

            // присваиваем локальной переменной ссылк на объект
            nameTextField = controllerTextField
        }


        controller.addAction(action)

        present(controller,animated: true,completion: nil)
    }

    //MARK: - SaveData and Load

    func loadItems() {
        
        // Хочу сделать вывод всех продуктов независимо от категории
        
        if categoryItemsString == "Все товары" {
            
            itemExemplArray = realm.objects(Item.self)
            
        } else {
            
            itemExemplArray = selectedCategory?.itemList.sorted(byKeyPath: "value", ascending: true)
        }

        self.tableView.reloadData()
    }
    
    // MARK: - Swipe DELETE and READ methods
    override func deleteRow(at indexPath: IndexPath) {
        
        if let item = itemExemplArray?[indexPath.row] {
            
            do {
                try realm.write {
                    realm.delete(item)
                }
            }catch {
                print("Delete Item Error \(error)")
            }
            
        }
    }
    
    override func readMore(at indexPath: IndexPath) {
        print("Read More item info")
    }

}






// MARK: - Search bar methods

extension TodoyeTableViewController : UISearchBarDelegate {
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // Задача стоит в том чтобы сортировать объекты по дате создания!
        
        itemExemplArray = itemExemplArray?.filter("value CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        
        tableView.reloadData()

    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {


        if searchBar.text?.count == 0 {

            loadItems()

            DispatchQueue.main.async {

                // Убрать клавиатуру
                searchBar.resignFirstResponder()
            }


        }


    }



}










/////////////////// CORE DATA ///////////////////

//class TodoyeTableViewController: UITableViewController {
//
//
//    @IBOutlet var searchBarOutlet: UISearchBar!
//
//    @IBOutlet var addItemButton: UIBarButtonItem!
//
//
//
//    var categoryItemsString: String!
//
//
//    // MARK: - CategoryObject
//    var selectedCategory: Category? {
//
//        didSet {
//
//            categoryItemsString = selectedCategory!.name
//
//            loadItems()
//
//            self.navigationItem.title = categoryItemsString
//        }
//
//    }
//
//    // Здесь я попробую сделать через класс
//
//    var itemExemplArray = [Item]()
//
//
//
//
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//
//    //MARK: - TableViewDataSource Methods
//
//    // Сколько строчек в секторе
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return itemExemplArray.count
//    }
//
//    // Какой тип ячейки отобразить
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
//
//        let text = itemExemplArray[indexPath.row].value
//
//        cell.textLabel?.text = text
//
//        // Сделал так чтобы отображалиьс ячейки с выбранными элементами через добавление этих элементов в Set! Но это будет работать только в случае если каждый элемент уникален
//
//        cell.accessoryType = itemExemplArray[indexPath.row].done ? .checkmark : .none
//
//        return cell
//    }
//
//    //MARK: - TableView Delegate Methods
//
//    // Срабатывает когда мы выбираем строку
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        // Поставить марку что выбрали переключаем флаг
//        itemExemplArray[indexPath.row].done = !itemExemplArray[indexPath.row].done
//
//        //DELETE
//
//        //        context.delete(itemExemplArray[indexPath.row])
//        //        itemExemplArray.remove(at: indexPath.row)
//
//
//        // UPDATE значение просто по ключу!
//
//        //        itemExemplArray[indexPath.row].setValue("Completed", forKey: "value")
//
//        // Не забываем сохранить эти изменения в Plist
//
//        saveItem()
//
//        // Снять выбор со строчки
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//
//
//    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
//
//        var nameTextField = UITextField()
//
//        // при нажате на + Добавим новые данные в таблицу! Используем Алерт Контроллер
//
//        let controller = UIAlertController(title: "Добавим в таблицу", message: "Напишите задание", preferredStyle: .alert)
//
//        // 2 По нажатию кнопку запускается это замыкание
//        let action = UIAlertAction(title: "Добавить", style: .default) { (action) in
//
//            //            let item = Item()
//            let item = Item(context: self.context)
//
//
//            item.value = nameTextField.text!
//            item.done = false
//            item.parentCategory = self.selectedCategory
//
//
//            self.itemExemplArray.append(item)
//
//            //Сохраним данные в свой Plist
//
//            self.saveItem()
//
//        }
//
//        // 1 Создается поле в контроллере Название продукта
//        controller.addTextField { (controllerTextField) in
//            controllerTextField.placeholder = "Название продукта"
//
//            // присваиваем локальной переменной ссылк на объект
//            nameTextField = controllerTextField
//        }
//
//
//        controller.addAction(action)
//
//        present(controller,animated: true,completion: nil)
//    }
//
//
//    //MARK: - SaveData and Load
//
//    func saveItem() {
//        // Функция принимает данные и добавляет их в свой plist
//
//
//        do {
//            // преобразовали данные
//            try context.save()
//
//        } catch {
//
//            print("Error saving context \(error)")
//        }
//
//        self.tableView.reloadData()
//
//    }
//
//    //    func loadCategoryItems() {
//    //
//    //        let request: NSFetchRequest<Item> = Item.fetchRequest()
//    //
//    //        if categoryItemsString != "Все продукты" {
//    //
//    //            request.predicate = NSPredicate(format: "parentCategory.name MATCHES %@", categoryItemsString)
//    //
//    //            request.sortDescriptors = [NSSortDescriptor(key: "value", ascending: true)]
//    //
//    //        } else {
//    //            // Не даем добавлять товары в режиме все товары
//    //            addItemButton.isEnabled = false
//    //        }
//    //
//    //        loadItems(with: request)
//    //    }
//
//
//    // with request: NSFetchRequest<Item> = Item.fetchRequest()
//    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(),with predicate : NSPredicate? = nil) {
//
//        var finalPredict = predicate
//
//        if categoryItemsString != "Все продукты" {
//
//            let categoryPredicat = NSPredicate(format: "parentCategory.name MATCHES %@", categoryItemsString)
//
//            finalPredict = categoryPredicat
//
//            if let pred = predicate {
//
//                let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicat,pred])
//
//                finalPredict = compoundPredicate
//            }
//
//
//        }
//        // если здесь будет nil то будет обычный поиск всех возможных
//        request.predicate = finalPredict
//
//        do {
//
//            itemExemplArray =  try context.fetch(request)
//        } catch {
//
//            print("Error Fetch in Database \(error)")
//        }
//
//        self.tableView.reloadData()
//    }
//
//}
//
////MARK: - Search bar methods
//extension TodoyeTableViewController : UISearchBarDelegate {
//
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//
//        // если написанна хоть 1 буква
//        if searchBar.text!.count > 0 {
//
//            let predicate = NSPredicate(format: "value CONTAINS[cd] %@", searchBar.text!)
//
//            request.sortDescriptors = [NSSortDescriptor(key: "value", ascending: true)]
//
//            loadItems(with: request, with: predicate)
//        }
//
//
//    }
//
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//
//        if searchBar.text?.count == 0 {
//
//            loadItems()
//
//            DispatchQueue.main.async {
//
//                // Убрать клавиатуру
//                searchBar.resignFirstResponder()
//            }
//
//
//        }
//
//
//    }
//
//
//}
//


// Plist который сохраняет данные в корне телефона по id приложения
// сохранить и достать данные легко set .array
//    let defaults = UserDefaults.standard


// Создаем свой Plist c данными
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")


// сохранение и загрузка в Plist ///////////



//func saveItem() {
//    // Функция принимает данные и добавляет их в свой plist
//
//    let encoder = PropertyListEncoder()
//
//    do {
//        // преобразовали данные
//        let dataEncode = try encoder.encode(self.itemExemplArray)
//        // Записали по указанному адресу
//        try dataEncode.write(to: dataFilePath!)
//    } catch {
//
//        print(error)
//    }
//
//
//
//}
//
//
//// Загрузим данные из своего Plist
//func loadItems() {
//
//    if let data = try? Data(contentsOf: dataFilePath!) {
//
//        let decoder = PropertyListDecoder()
//        do {
//
//            itemExemplArray = try decoder.decode([Item].self, from: data)
//        } catch {
//
//            print(error)
//        }
//
//
//    }
//
//
//}

