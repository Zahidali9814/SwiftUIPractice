//
//  StateVsObservedObject.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 17/08/2025.
//

// This is the class that discribe the differnce between @StateObject and @ObservedObject

import SwiftUI
import Combine

final class viewModel: ObservableObject {
    
    @Published var count: Int = 0
    
    init() {
        print("init called")
    }
    func incrementCount() {
        count += 1
    }
}
struct StateVsObservedObject: View {
    
    @StateObject var vm = viewModel() // @ObservedObject not save the data and reload when its parent is reload if we use the @StateObject the value of Count is saved that @StateObject is hold the data. 
    
    var body: some View {
        
        Text("Count: \(vm.count)")

        Button("Increment") {
            vm.incrementCount()
        }
        .buttonStyle(.borderedProminent)
    }
}

struct RandomNumberView: View {
    
    @State var number: Int = 0
     
    var body: some View {
        VStack(spacing: 24) {
            Text("Random Number: \(number)")
            Button("Generate random number") {
                number = (0...100).randomElement() ?? 0
            }
            
            StateVsObservedObject()
        }
    }
}
#Preview {
    RandomNumberView()
}

