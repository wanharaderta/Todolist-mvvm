//
//  TodoModel.swift
//  Todolist
//
//  Created by Wanhar on 26/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import Foundation

struct TodoModel: Hashable {
    var title:String
    var desc:String
    var id = UUID()
}
