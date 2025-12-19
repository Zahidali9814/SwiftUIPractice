//
//  ListView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

import SwiftUI

struct ListView: View {
    
    @State private var items: [ToDoItem] = []
    @State private var newItemName: String = ""
    
    var body: some View {
        
        NavigationStack {
            List {
                Section(header: Text("Add New Task")) {
                    HStack {
                        TextField("Task Name", text: $newItemName)
                        Button(action: addNewItem) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.orange)
                        }
                    }
                }
                
                Section(header: Text("My Tasks")) {
                    ForEach(items) { item in
                        Text(item.name)
                    }
                    .onDelete(perform: deleteItem)
                }
            }
            .navigationTitle("Task list")
            .toolbar {
                EditButton()
            }
        }
    }
    func addNewItem() {
        if !newItemName.isEmpty {
            items.append(ToDoItem(name: newItemName))
            newItemName = ""
        }
    }
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

#Preview {
    ListView()
}
