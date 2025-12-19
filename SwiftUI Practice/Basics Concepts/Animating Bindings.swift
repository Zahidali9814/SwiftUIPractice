//
//  Animating Bindings.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

// Bindings can also be animated, particularly useful when dealing with gestures.
import SwiftUI

struct Animating_Bindings: View {
    @State private var position = CGSize.zero
    
    var body: some View {
        VStack{
            Spacer()
            Circle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
                .offset(position)
                .animation(.spring(), value: position)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            position = gesture.translation
                        }
                        .onEnded { _ in
                            position = .zero
                        }
                )
            Spacer()
        }
    }
}

#Preview {
    Animating_Bindings()
}
