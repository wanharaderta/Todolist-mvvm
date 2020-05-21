//
//  AddTodoViewModel.swift
//  Todolist
//
//  Created by Wanhar on 21/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

class AddTodoViewModel {
    
    var title   : String = ""
    var desc    : String = ""
    
    func saveTodo(){
        CoreDataManager.shared.saveTodo(title : self.title, desc : self.desc)
    }
}
