//
//  UpdateTodoViewModel.swift
//  Todolist
//
//  Created by Wanhar on 26/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

class UpdateTodoViewModel {
    var title = ""
    var desc  = ""
    var id = UUID()
    
    init(todo:Todo) {
        self.title  = todo.title!
        self.desc   = todo.desc!
        self.id     = todo.id!
    }
}
