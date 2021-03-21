//
//  ContentView.swift
//  Todolist
//
//  Created by Kajal on 21/3/21.
//  Copyright © 2021 Kajal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel :TodoListViewModel
    @State private var isPresented : Bool = false
    @State private var searchTerm: String = ""
    
    
    init() {
        self.viewModel = TodoListViewModel()
    }
    
    private func delete(at offsets:IndexSet){
        offsets.forEach { index in
            let todo = self.viewModel.todos[index]
            self.viewModel.deleteTodo(viewModel: todo)
        }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(self.viewModel.todos.filter {
                    self.searchTerm.isEmpty ? true :
                        $0.title.localizedCapitalized.contains(self.searchTerm)
                }, id: \.title) { todo in
                    NavigationLink(destination: UpdateTodoView(todo: TodoModel(title: todo.title))){
                        TodoCell(todo: todo)
                    }.onAppear() {
                        self.viewModel.fetchAllTodos()
                    }
                }.onDelete(perform: delete)
            }
            .sheet(isPresented: self.$isPresented, onDismiss: {
                
                self.viewModel.fetchAllTodos()
            },content: {
                AddTodoView(isPresented: self.$isPresented)
            })
                .navigationBarTitle("Todo List")
                .navigationBarItems(trailing: Button("Add"){
                    self.isPresented = true
                })
        }
    }
    
    
}


struct TodoCell: View {
    let todo : TodoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(todo.title)
                .font(.headline)
        }
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
