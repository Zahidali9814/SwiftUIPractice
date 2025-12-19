//
//  ObservedObjectConcept.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

//Observes an external data model.
//Does not own the model.
//Use when the view needs to respond to changes in the model.

import SwiftUI
import Combine

class CounterModel: ObservableObject {
    @Published var counter = 0
}

struct ObservedObjectConcept: View {
    
    @ObservedObject var model = CounterModel()
    
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
    ObservedObjectConcept()
}
