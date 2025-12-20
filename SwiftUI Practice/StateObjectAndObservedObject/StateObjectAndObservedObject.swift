//
//  StateVsObservedObject.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 17/08/2025.
//

// @ObservedObject:
// Does NOT own the object.
// Holds only a reference and expects the object to be created elsewhere.
// The view reloads when the object’s @Published properties change.

// @StateObject:
// Owns the object.
// Creates and holds the reference for the lifetime of the view.
// The object is NOT recreated when the view reloads.

// @State:
// Used for simple, value-type state local to the view.
// The view reloads whenever the value changes.

import SwiftUI
import Combine

class CounterViewModel: ObservableObject {
    
    @Published var count = 0
    
    // for testing use init for logs run code in simulator
    init() {
        print("Debug: Did init") // replace @ObservedObject with @StateObject and see the majic in console area
        // when use @ObservedObject it reload and when use @Stateobject then does not reload because @Stateobject hold the reference
    }
    
    func increaseCount() {
        count += 1
    }
}

struct StateObjectAndObservedObject: View {
    
    @ObservedObject var viewModel = CounterViewModel()
    //    @StateObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack (spacing: 16) {
            Text("Count: \(viewModel.count)")
            
            Button("Increase Count") {
                viewModel.increaseCount()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct RandomNumberGenerator: View {
    
    @State private var randomNumber = 0
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Random Number: \(randomNumber)")
            
            Button("Generate Random Number") {
                randomNumber = (0...100).randomElement() ?? 0
            }
        }
        .padding()
        StateObjectAndObservedObject()
    }
}

#Preview {
    RandomNumberGenerator()
}

