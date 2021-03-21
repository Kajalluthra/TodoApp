//
//  AddTodoViewModel.swift
//  Todolist
//
//  Created by Kajal on 21/3/21.
//  Copyright © 2021 Kajal. All rights reserved.
//

import Foundation

class AddTodoViewModel {
    
    var title   : String = ""
    var desc    : String = ""
    
    func saveTodo(){
        CoreDataManager.shared.saveTodo(title : self.title, desc : self.desc)
    }

    func deleteTodo(_ newTitle: String) {
        CoreDataManager.shared.deleteTodo(title: newTitle)
    }
}
