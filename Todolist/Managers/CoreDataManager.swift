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
    
    func fetchTodo(title:String) -> Todo? {
        var todos    = [Todo]()
        
        let request: NSFetchRequest<Todo>    = Todo.fetchRequest()
        request.predicate    = NSPredicate(format: "title == %@", title)
        
        do {
            todos = try self.moc.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return todos.first
    }
    
    func deleteTodo(title:String){
        do {
            if let todo = fetchTodo(title: title){
                self.moc.delete(todo)
                try self.moc.save() 
            }
        } catch let error as NSError {
            print(error)
        }
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
