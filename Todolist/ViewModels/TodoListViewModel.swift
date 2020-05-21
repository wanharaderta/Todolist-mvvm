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
    
    @Published var todos   = [TodoViewModel]()
    
    init() {
        fetchAllTodos()
    }
    
    func fetchAllTodos() {
        self.todos  = CoreDataManager.shared.getAllTodos().map(TodoViewModel.init)
        print(self.todos)
    }
}
