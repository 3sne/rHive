//
//  Items.swift
//  rHive
//
//  Created by Mahima Borah on 05/11/18.
//  Copyright © 2018 M2V. All rights reserved.
//

import Foundation

class Item{
    var name : String = "Random"
    var category : String = "Random"
    var description : String = ""
    var price : String = ""
    
    init(name: String, category: String) {
        self.name = name
        self.category = category
    }
}
