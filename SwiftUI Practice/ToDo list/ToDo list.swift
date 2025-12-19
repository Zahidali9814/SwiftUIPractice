//
//  MainView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    let task: String
    var isCompleted: Bool
}

struct MainViewList: View {
    
    @State private var todoItems: [TodoItem] = []
    @State private var newTask: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New task", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button(action: {
                        addNewTask()
                    }) {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    .padding(.trailing)
                }
                
                List {
                    ForEach(todoItems) { item in
                        HStack {
                            Text(item.task)
                                .strikethrough(item.isCompleted, color: .black)
                            Spacer()
                            Button(action: {
                                toggleTaskCompletion(item: item)
                            }) {
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("To-Do List")
        }
    }
    
    // Function to add a new task
    private func addNewTask() {
        if !newTask.isEmpty {
            let newItem = TodoItem(task: newTask, isCompleted: false)
            todoItems.append(newItem)
            newTask = ""
        }
    }
    
    // Function to toggle task completion
    private func toggleTaskCompletion(item: TodoItem) {
        if let index = todoItems.firstIndex(where: { $0.id == item.id }) {
            todoItems[index].isCompleted.toggle()
        }
    }
}

#Preview {
    MainViewList()
}
