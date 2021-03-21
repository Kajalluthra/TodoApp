//
//  TodoViewModel.swift
//  Todolist
//
//  Created by Kajal on 21/3/21.
//  Copyright © 2021 Kajal. All rights reserved.
//

import Foundation
import CoreData

class TodoViewModel {
    
    var title = ""
    var desc  = ""
    var id = UUID()
    
    init(todo:Todo) {
        self.title  = todo.title!
    }
}
