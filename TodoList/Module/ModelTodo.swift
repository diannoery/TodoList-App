//
//  ModelTodo.swift
//  TodoList
//
//  Created by DiianNoery on 14/11/24.
//

import Foundation
struct Todo: Codable, Identifiable {
    let id: Int
    var title: String
    var isCompleted: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case isCompleted = "completed"
    }
}
