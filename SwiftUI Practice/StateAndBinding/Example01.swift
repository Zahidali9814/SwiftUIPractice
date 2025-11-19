//
//  StateAndBindingView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 17/08/2025.
//

import SwiftUI

struct Example01: View {
    
    @State private var count: Int = 0
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Count: \(count)")
            
            Button("Increment") {
                count += 1
            }
        }
    }
}

#Preview {
    Example01()
}
