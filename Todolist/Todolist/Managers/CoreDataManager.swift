//
//  CoreDataManager.swift
//  Todolist
//
//  Created by Kajal on 21/3/21.
//  Copyright © 2021 Kajal. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    var managedObject : NSManagedObjectContext
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    private init(moc:NSManagedObjectContext){
        self.managedObject = moc
    }
    
    func fetchTodo(title:String) -> Todo? {
        var todos = [Todo]()
        
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        request.predicate = NSPredicate(format: "title == %@", title)
        
        do {
            todos = try self.managedObject.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return todos.first
    }
    
    func deleteTodo(title:String){
        do {
            if let todo = fetchTodo(title: title){
                self.managedObject.delete(todo)
                try self.managedObject.save() 
            }
        } catch let error as NSError {
            print(error)
        }
    }

    func getAllTodos() -> [Todo] {
        var todos = [Todo]()
        let todosRequest : NSFetchRequest<Todo>  = Todo.fetchRequest()
        
        do {
            todos = try self.managedObject.fetch(todosRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return todos
    }
    
    func saveTodo(title :String, desc : String){
        let todo = Todo(context: self.managedObject)
        todo.title = title
        todo.id = UUID()
        
        do {
            try self.managedObject.save()
        } catch let error as NSError {
            print(error)
        }
    }
}
