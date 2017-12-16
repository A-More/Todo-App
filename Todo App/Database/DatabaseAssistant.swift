//
//  DatabaseAssistant.swift
//  Todo App
//
//  Created by Akshay More on 11/12/17.
//  Copyright © 2017 Akshay More. All rights reserved.
//

import Foundation
import SQLite

class DatabaseAssistant {
    static let instance = DatabaseAssistant()
    private let db: Connection?

    /* fields for Category table and columns*/
    private let categories = Table("Category")
    private let catId = Expression<Int64>("id")
    private let catName = Expression<String>("name")


    /* fields for Task table and columns*/
    private let tasks = Table("Task")
    private let tId = Expression<Int64>("id")
    private let tName = Expression<String>("name")
    private let category = Expression<Int64>("c_id")
    private let reminder = Expression<String>("reminder")

    private init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        do {
            db = try Connection("\(path)/todo_database.sqlite3")
        } catch {
            db = nil
            print ("Unable to open database")
        }
        createCategory()
        createTask()

    }

    func createCategory(){
        do {
            let createQuery = categories.create(ifNotExists: true) { table in
                table.column(catId, primaryKey: .autoincrement)
                table.column(catName)
            }
            try db?.run(createQuery)
        } catch {
            print("unable to open database")
        }
    }

    func createTask(){
        do{
            let createQuery = tasks.create(ifNotExists: true) { table in
                table.column(tId, primaryKey: .autoincrement)
                table.column(tName)
                table.column(category)
                table.column(reminder)
            }
            try db?.run(createQuery)
        } catch {
            print("unable to open database")
        }
    }
}


