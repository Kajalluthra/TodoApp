//
//  TodoDetailView.swift
//  Todolist
//
//  Created by Kajal on 21/3/21.
//  Copyright © 2021 Kajal. All rights reserved.
//

import SwiftUI
import UIKit

struct UpdateTodoView: View {
    let todo: TodoModel
    @State var addTodoVM = AddTodoViewModel()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            VStack {
                TextField(todo.title, text: self.$addTodoVM.title)
                    .padding(.all)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Update"){
                    print(self.$addTodoVM.title)
                    self.addTodoVM.deleteTodo(self.todo.title)
                    self.addTodoVM.saveTodo()

                    self.mode.wrappedValue.dismiss()
                    
                }.padding(16)
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.top, 16)
            .navigationBarTitle("Update Todo")
        }

    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateTodoView(todo: TodoModel(title: ""))
    }
}
