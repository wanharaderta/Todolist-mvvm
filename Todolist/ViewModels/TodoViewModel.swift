//
//  TodoViewModel.swift
//  Todolist
//
//  Created by Wanhar on 21/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation
import CoreData

class TodoViewModel {
    
    var title = ""
    var desc  = ""
    
    init(todo:Todo) {
        self.title  = todo.title!
        self.desc   = todo.desc!
    }
}
