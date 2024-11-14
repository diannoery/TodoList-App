//
//  TodoViewModel.swift
//  TodoList
//
//  Created by DiianNoery on 14/11/24.
//

// TodoViewModel.swift
import Foundation

@MainActor
class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showingDeleteAlert = false
    
    func fetchTodos() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                todos = try await TodoService.fetchTodos()
            } catch {
                errorMessage = "Failed to fetch todos: \(error.localizedDescription)"
            }
            isLoading = false
        }
    }
    
    func addTodo(title: String) {
        Task {
            do {
                let newTodo = try await TodoService.createTodo(title: title)
                todos.append(newTodo)
            } catch {
                errorMessage = "Failed to create todo: \(error.localizedDescription)"
            }
        }
    }
    
    func toggleTodo(_ todo: Todo) {
        Task {
            do {
                let updatedTodo = try await TodoService.toggleTodo(todo)
                if let index = todos.firstIndex(where: { $0.id == todo.id }) {
                    todos[index] = updatedTodo
                }
            } catch {
                errorMessage = "Failed to update todo: \(error.localizedDescription)"
            }
        }
    }
    
    func deleteTodo(_ todo: Todo) {
        Task {
            do {
                try await TodoService.deleteTodo(todo.id)
                todos.removeAll { $0.id == todo.id }
            } catch {
                errorMessage = "Failed to delete todo: \(error.localizedDescription)"
            }
        }
    }
    
    func deleteAllTodos() {
        let todoIds = todos.map { $0.id }
        
        Task {
            do {
                try await TodoService.deleteAllTodos(todoIds)
                todos.removeAll()
            } catch {
                errorMessage = "Failed to delete all todos: \(error.localizedDescription)"
            }
        }
    }
}
