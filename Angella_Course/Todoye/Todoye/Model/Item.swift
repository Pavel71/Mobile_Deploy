//
//  Item.swift
//  Todoye
//
//  Created by PavelM on 26/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var value: String = ""
    @objc dynamic var backgroundColor: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?

    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "itemList")
}

