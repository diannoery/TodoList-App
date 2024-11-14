//
//  TodoService.swift
//  TodoList
//
//  Created by DiianNoery on 14/11/24.
//
// TodoService.swift
import Foundation

class TodoService {
    static let baseURL = "https://jsonplaceholder.typicode.com/todos"
    
    static func fetchTodos() async throws -> [Todo] {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let todos = try JSONDecoder().decode([Todo].self, from: data)
        return todos
    }
    
    static func createTodo(title: String) async throws -> Todo {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let newTodo = ["title": title, "completed": false] as [String : Any]
        request.httpBody = try JSONSerialization.data(withJSONObject: newTodo)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Todo.self, from: data)
    }
    
    static func toggleTodo(_ todo: Todo) async throws -> Todo {
        guard let url = URL(string: "\(baseURL)/\(todo.id)") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let updatedTodo = ["completed": !todo.isCompleted]
        request.httpBody = try JSONSerialization.data(withJSONObject: updatedTodo)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Todo.self, from: data)
    }
    
    static func deleteTodo(_ id: Int) async throws {
        guard let url = URL(string: "\(baseURL)/\(id)") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let (_, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
    }
    
    static func deleteAllTodos(_ ids: [Int]) async throws {
        // Use Task group to delete multiple todos concurrently
        try await withThrowingTaskGroup(of: Void.self) { group in
            for id in ids {
                group.addTask {
                    try await deleteTodo(id)
                }
            }
            // Wait for all deletions to complete
            try await group.waitForAll()
        }
    }
}
