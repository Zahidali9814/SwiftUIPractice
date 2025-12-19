//
//  BindingConcept.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

//Connects a child view to a parent view’s state.
//Allows two-way data binding.
//Use for passing state down the view hierarchy.

import SwiftUI

struct BindingConcept: View {
    var body: some View {
    }
}

// MARK: - @Binding Concept
struct ParentViewStruct: View {
    
    @State private var count = 0
    
    var body: some View {
        childviewStruct(countValue: $count)
    }
}

#Preview{
    ParentViewStruct()
}

struct childviewStruct: View {
    
    @Binding var countValue: Int
    
    var body: some View {
       Text("Count is: \(countValue)")
        Button("Add"){
            countValue += 1
        }
    }
}
