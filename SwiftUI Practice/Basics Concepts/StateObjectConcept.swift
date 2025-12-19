//
//  StateObjectConcept.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

//Creates and owns an instance of an observable object.
//Manages the lifecycle of the state object.
//Use when the view should instantiate and control the model’s lifecycle.

import SwiftUI
import Combine

class CounterModell: ObservableObject {
    @Published var counter = 0
}

struct StateObjectConcept: View {
    
    @StateObject private var model = CounterModel()
    
    var body: some View {
        VStack {
            Text("Counter: \(model.counter)")
            Button("Increment") {
                model.counter += 1
            }
        }
    }
}

#Preview {
    StateObjectConcept()
}
