//
//  AddTodoView.swift
//  Todolist
//
//  Created by Wanhar on 21/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import SwiftUI

struct AddTodoView: View {
    
    @State var addTodoVM = AddTodoViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                VStack {
                    TextField("Title", text: self.$addTodoVM.title)
                        .padding(16)
                    TextField("Descripsion", text: self.$addTodoVM.desc)
                        .padding(16)
                    Button("Save"){
                        self.addTodoVM.saveTodo()
                    }.padding(16)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                
            }.padding()
                
                .navigationBarTitle("Todo List")
        }
    }
}

#if DEBUG
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
#endif
