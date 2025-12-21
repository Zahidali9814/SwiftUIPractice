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


///SwiftUI Property Wrappers: @StateObject vs @ObservedObject
///
//In SwiftUI, @StateObject and @ObservedObject are both used to manage observable objects, but they behave differently in terms of lifecycle and ownership:

//1. @StateObject (Recommended for Creating ViewModel)

//SwiftUI owns and manages the lifecycle of the object.
//The instance persists even when the view is recreated.
//Ideal for creating the ViewModel inside a view.

//2. @ObservedObject (For Injecting Existing ViewModel)

//The view does not own the object; it depends on an external source.
//When the view is recreated, a new instance is created, resetting state.
//Ideal for passing an already created object from a parent.
