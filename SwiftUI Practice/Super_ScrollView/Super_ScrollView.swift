//
//  Super_ScrollView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 22/12/2025.
//

import SwiftUI

struct Super_ScrollView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockData.items) { item in
                    Circle()
                    //  .frame(width: 100, height: 100)        // normal
                        .containerRelativeFrame(.horizontal,
                                                count: verticalSizeClass == .regular ? 2 : 4, spacing: 16)
                        .foregroundStyle(item.color.gradient)
                }
            }
            .scrollTargetLayout()
        }
        //        .padding()
        .contentMargins(16, for: .scrollContent) // by this bottom bar is goes down
        .scrollTargetBehavior(.viewAligned) // showing left and right side cicles that is exist for good user interface like paging
    }
}

#Preview {
    Super_ScrollView()
}

struct Item: Identifiable {
    let id = UUID()
    let color: Color
}

struct MockData {
    static let items = [
        Item(color: .teal),
        Item(color: .red),
        Item(color: .blue),
        Item(color: .pink),
        Item(color: .purple),
        Item(color: .orange),
        Item(color: .cyan),
        Item(color: .black),
        Item(color: .green),
        Item(color: .teal),
        Item(color: .red),
        Item(color: .blue),
        Item(color: .pink),
        Item(color: .purple),
        Item(color: .orange),
        Item(color: .cyan),
        Item(color: .black),
        Item(color: .green),
    ]
}
