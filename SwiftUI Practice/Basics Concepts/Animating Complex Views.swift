//
//  Animating Complex Views.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

// You can combine multiple animations and apply them to complex views.
import SwiftUI

struct Animating_Complex_Views: View {
    @State private var rotation: Double = 0.0
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 1.0
    
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotation))
                .scaleEffect(scale)
                .opacity(opacity)
                .animation(.easeInOut(duration: 1.0), value: rotation)
                .animation(.easeInOut(duration: 1.0), value: scale)
                .animation(.easeInOut(duration: 1.0), value: opacity)
            Spacer()
            Button("Animate All") {
                withAnimation {
                    rotation += 45
                    scale += 0.5
                    opacity -= 0.2
                }
            }
            .padding()
        }
    }
}

#Preview {
    Animating_Complex_Views()
}
