//
//  Category.swift
//  Todoye
//
//  Created by PavelM on 26/02/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var backroundColor: String?
    let itemList = List<Item>()
}

