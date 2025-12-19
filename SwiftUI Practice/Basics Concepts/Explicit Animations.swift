//
//  Explicit Animations.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

// Explicit animations give you more control over how and when animations are applied using the withAnimation function.

import SwiftUI

struct Explicit_Animations: View {
    @State private var rotation: Double = 0.0
    
    var body: some View {
        VStack{
            Spacer()
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotation))
            
            Spacer()
            Button("Rotate"){
                withAnimation(.easeInOut(duration: 1.0)) {
                    rotation += 90
                }
            }
            .padding()
        }
    }
}

#Preview {
    Explicit_Animations()
}
