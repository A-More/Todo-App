//
//  Task.swift
//  Todo App
//
//  Created by Akshay More on 19/12/17.
//  Copyright © 2017 Akshay More. All rights reserved.
//

import Foundation

class Task {
    var tId: Int
    var tName: String
    var tCatId: Int
    var tRem: String
    
    init(tId: Int, tName: String, tCatId: Int, tRem: String) {
        self.tId = tId
        self.tName = tName
        self.tCatId = tCatId
        self.tRem = tRem
    }
}
