//
//  StateManagement.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

import SwiftUI

struct StateManagement: View {
    
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text("Counter: \(counter)")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                counter += 1
            }) {
                Text("Increment")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    StateManagement()
}
