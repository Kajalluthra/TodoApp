//
//  AddTodoView.swift
//  Todolist
//
//  Created by Kajal on 21/3/21.
//  Copyright © 2021 Kajal. All rights reserved.
//

import SwiftUI

struct AddTodoView: View {
    
    @State var addTodoVM = AddTodoViewModel()
    @Binding var isPresented:Bool
    
    var body: some View {
        NavigationView {
            VStack {

                TextField("Title", text: self.$addTodoVM.title)
                    .padding(.all)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Save"){
                    self.addTodoVM.saveTodo()
                    self.isPresented = false
                }.padding(16)
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.top, 0)
            
            .navigationBarTitle("Add Todo")
        }
        
    }
}

#if DEBUG
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(isPresented: .constant(false))
    }
}
#endif
