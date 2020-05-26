//
//  TodoDetailView.swift
//  Todolist
//
//  Created by Wanhar on 26/05/20.
//  Copyright © 2020 Wanhar. All rights reserved.
//

import SwiftUI

struct TodoDetailView: View {
    
    //@State var viewModel : UpdateTodoViewModel
    let todo: TodoModel
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text(todo.title)
                .font(.largeTitle)
            Text(todo.desc)
                .font(.title)
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: TodoModel(title: "", desc: ""))
    }
}
