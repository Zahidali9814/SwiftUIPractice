//
//  MainView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 17/08/2025.
//

import SwiftUI
import Combine

final class viewModell: ObservableObject {
    
    @Published var count: Int = 0
    
    func incrementCount() {
        count += 1
    }
    func resetCount() {
        count = 0
    }
}

// MainView Creates a ViewModel...that ensure the instance persistant.
struct MainView: View {
    
    @StateObject var vm = viewModell()
    
    var body: some View {
        
        VStack(spacing: 24) {
            Text("Main View Counter: \(vm.count)")
                .font(.title)
            
            CounterView(vm: vm)
            IncrementView(vm: vm)
            
            Button("Reset") {
                vm.resetCount()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

// Uses ViewModel....Observe changes doesn't recreate....Observes the same shared instance...this is dependent on Parent view that is MainView
struct CounterView: View {
    
    @ObservedObject var vm: viewModell
    
    var body: some View {
        Text("Counter View Count: \(vm.count)")
            .font(.headline)
            .padding()
            .background(.gray.opacity(0.2))
            .cornerRadius(10)
    }
}

// Uses ViewModel....Observe changes doesn't recreate ....Observes the same shared instance..this is dependent on Parent view that is MainView
struct IncrementView: View {
    
    @ObservedObject var vm: viewModell
    
    var body: some View {
        Button("Increment") {
            vm.incrementCount()
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    MainView()
}
