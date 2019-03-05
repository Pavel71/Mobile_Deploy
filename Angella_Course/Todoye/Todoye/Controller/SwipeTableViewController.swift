//
//  SwipeTableViewController.swift
//  Todoye
//
//  Created by PavelM on 27/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit
import SwipeCellKit
import ChameleonFramework

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
   
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        self.navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    // MARK: - TableViewDataSource
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        
        // SwipeCellDelegate
        cell.delegate = self
        
        
        return cell
    }
    
    
    
    // MARK: - SwipeCellDelegate
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { (action, indexPath) in

            self.deleteRow(at: indexPath)

        }
        
        // Добавляем несколько action
        let updateAction = SwipeAction(style: .default, title: "Update") { (action, indePath) in
            self.readMore(at: indexPath)
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")
        updateAction.image = UIImage(named: "read")
    
        return [deleteAction,updateAction]
        
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        //        options.transitionStyle = .reveal
        return options
    }
    
    func deleteRow(at indexPath: IndexPath) {
        // Update Model in SubClass
        
    }
    
    func readMore(at indexPath: IndexPath) {
        // Read Model in SubClass
        
    }



}
