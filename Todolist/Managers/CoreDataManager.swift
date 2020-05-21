//
//  CoreDataManager.swift
//  Todolist
//
//  Created by Wanhar on 21/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    var moc : NSManagedObjectContext
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    private init(moc:NSManagedObjectContext){
        self.moc = moc
    }

    func getAllTodos() -> [Todo] {
        var todos   = [Todo]()
        let todosRequest : NSFetchRequest<Todo>  = Todo.fetchRequest()
        
        do {
            todos = try self.moc.fetch(todosRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return todos
    }
    
    func saveTodo(title :String, desc : String){
        let todo    = Todo(context: self.moc)
        todo.title   = title
        todo.desc   = desc
        
        do {
            try self.moc.save()
        } catch let error as NSError {
            print(error)
        }
    }
}
