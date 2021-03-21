//
//  TodoListViewModel.swift
//  Todolist
//
//  Created by Kajal on 21/3/21.
//  Copyright © 2021 Kajal. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class TodoListViewModel : ObservableObject {
    
    @Published var todos   = [TodoViewModel]()
    
    init() {
        fetchAllTodos()
    }
    
    func fetchAllTodos() {
        self.todos  = CoreDataManager.shared.getAllTodos().map(TodoViewModel.init)
        print(self.todos)
    }
    
    func deleteTodo(viewModel:TodoViewModel) {
        CoreDataManager.shared.deleteTodo(title: viewModel.title)
        fetchAllTodos()
    }
}
