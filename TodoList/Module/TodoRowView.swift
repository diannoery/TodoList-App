//
//  TodoRowView.swift
//  TodoList
//
//  Created by DiianNoery on 14/11/24.
//

import Foundation
import SwiftUI

struct TodoRowView: View {
    let todo: Todo
    let onToggle: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(todo.isCompleted ? .green : .gray)
                .onTapGesture {
                    onToggle()
                }
            
            Text(todo.title)
                .strikethrough(todo.isCompleted)
        }
    }
}
