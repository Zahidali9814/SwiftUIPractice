//
//  Implicit Animations.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

// Implicit animations are the simplest way to add animations to your SwiftUI views. They automatically animate changes to view properties.

import SwiftUI

struct Implicit_Animations: View {
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        VStack{
            Spacer()
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .scaleEffect(scale)
                .animation(.easeInOut(duration: 1.0), value: scale)
                
            Spacer()
            Button("Animate") {
                scale += 0.5
            }
            .padding()
        }
    }
}

#Preview {
    Implicit_Animations()
}
