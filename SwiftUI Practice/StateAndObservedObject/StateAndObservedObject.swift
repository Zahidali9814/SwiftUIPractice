//
//  StateVsObservedObject.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 17/08/2025.
//

import SwiftUI
import Combine

class CounterViewModel: ObservableObject {
    
   @Published var count = 0
    
    init() {
        print("Debug: Did init") // replace @ObservedObject with @StateObject and see the majic in console area
    }
    
    func increaseCount() {
        count += 1
    }
    
}

struct StateAndObservedObject: View {
    
    @ObservedObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            Text("Count: \(viewModel.count)")
            
            Button("Increase Count") {
                viewModel.increaseCount()
            }
        }
    }
}

struct RandomNumberGenerator: View {
    
    @State private var randomNumber = 0
    
    var body: some View {
        VStack {
            VStack {
                Text("Random: \(randomNumber)")
                
                Button("Generate Random Number") {
                    randomNumber = (0...100).randomElement()!
                }
            }
            StateAndObservedObject()
                .padding()
        }
    }
}

#Preview {
    RandomNumberGenerator()
}

