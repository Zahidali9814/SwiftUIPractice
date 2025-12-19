//
//  State.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

//Manages local state within a single view.
//The state is private to the view.
//Use for simple, ephemeral state
            
import SwiftUI

struct StateConcept: View {
    
    @State private var count = 0
    
    var body: some View {
        VStack {
            Text("Counter: \(count)")
            Button("Increment") {
                count += 1
            }
        }
    }
}

#Preview {
    StateConcept()
}
