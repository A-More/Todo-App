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
    private let tCat = Expression<Int64>("c_id")
    private let tRem = Expression<String>("reminder")

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
                table.column(tCat)
                table.column(tRem)
            }
            try db?.run(createQuery)
        } catch {
            print("unable to open database")
        }
    }
    
    func addCategory(categoryName: String){
        do{
                let cat = categories.insert(
                    catName <- categoryName ?? ""
                )
            try db!.run(cat)
        } catch {
            print(error)
        }
    }
    
    func updateCategory(category: Category) -> Bool{
        do{
            let cat = categories.filter(catId == Int64(category.catId))
            let catCheck = try db?.pluck(cat)
             if catCheck == nil{
                return false
            }
            let updateCategory = categories.update([
                catId <- Int64(category.catId),
                catName <- category.catName ?? ""
                ])
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func getCategories() -> [Category]{
        var cat: Category
        var cats = [Category]()
        do{
            for connection in (try(db?.prepare(categories)))!{
//                print("categoryName: \(connection[catName]) categoryId: \(connection[catId]) ")
                cat = Category(catId: Int(connection[catId]), catName: connection[catName])
                cats.append(cat)
            }
        } catch {
            print(error)
        }
        return cats
    }
    
    func addTask(taskName: String, catId: Int, taskReminder: String){
        do{
            let tsk = tasks.insert(tName <- taskName ?? "", tCat <- Int64(catId), tRem <- taskReminder ?? "")
            try db!.run(tsk)
        } catch {
            print(error)
        }
    }
    
    func updateTask(task: Task) -> Bool{
        do{
            let tk = tasks.filter(tId == Int64(task.tId))
            let taskCheck = try db?.pluck(tk)
            if taskCheck == nil{
                return false
            }
            let updateTask = tasks.update([
               tId <- Int64(task.tId),
               tName <- task.tName ?? "",
               tRem <- task.tRem,
               tCat <- Int64(task.tCatId)
                ])
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func getTask(catId: Int) -> [Task]{
        var task: Task
        var tsks = [Task]()
        do{
            let tsk = tasks.filter(tCat == Int64(catId))
            print(tsk.asSQL())
            for connection in try(db?.prepare(tsk))!{
                task = Task(tId: Int(connection[tId]), tName: connection[tName], tCatId: Int(connection[tCat]), tRem: connection[tRem])
                tsks.append(task)
            }
        } catch {
            print(error)
        }
        return tsks
    }
    
    
}


