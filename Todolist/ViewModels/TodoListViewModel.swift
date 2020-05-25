//
//  TodoListViewModel.swift
//  Todolist
//
//  Created by Wanhar on 21/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class TodoListViewModel : ObservableObject {
    
    @Published var todos   = [TodoModel]()
    
    init() {
        fetchAllTodos()
    }
    
    func fetchAllTodos() {
        self.todos  = CoreDataManager.shared.getAllTodos().map(TodoModel.init)
        print(self.todos)
    }
    
    func deleteTodo(viewModel:TodoModel) {
        CoreDataManager.shared.deleteTodo(title: viewModel.title)
        fetchAllTodos()
    }
}
