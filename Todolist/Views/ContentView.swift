//
//  ContentView.swift
//  Todolist
//
//  Created by Wanhar on 21/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
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
                
                // SearchBar is UIViewRepresentable
                SearchBar(text: $searchTerm)
                
                ForEach(self.viewModel.todos.filter {
                    self.searchTerm.isEmpty ? true :
                        $0.title.localizedCapitalized.contains(self.searchTerm)
                }, id: \.title) { todo in
                    NavigationLink(destination: TodoDetailView(todo: TodoModel(title: todo.title, desc: todo.desc))){
                        TodoCell(todo: todo)
                    }
                }.onDelete(perform: delete)
            }
            .sheet(isPresented: self.$isPresented, onDismiss: {
                
                self.viewModel.fetchAllTodos()
            },content: {
                AddTodoView(isPresented: self.$isPresented)
            })
                .navigationBarTitle("Todo List")
                .navigationBarItems(trailing: Button("Add Todo"){
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
            Text(todo.desc)
                .font(.subheadline)
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
