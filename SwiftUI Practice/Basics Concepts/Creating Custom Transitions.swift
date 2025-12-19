//
//  Creating Custom Transitions.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

// To create a custom transition, you define the entering and exiting views’ appearances using modifiers like scaleEffect, opacity, rotationEffect, etc.

import SwiftUI

extension AnyTransition {
    static var scaleAndFade: AnyTransition {
        AnyTransition.scale(scale: 0.1, anchor: .center)
            .combined(with: .opacity)
    }
}

struct Creating_Custom_Transitions: View {
    @State private var showDetails = false
    
    var body: some View {
           VStack {
               Spacer()
               if showDetails {
                   Rectangle()
                       .fill(Color.blue)
                       .frame(width: 200, height: 200)
                       .transition(.scaleAndFade)
                       .animation(.easeInOut(duration: 1.0), value: showDetails)
               }
               Spacer()
               Button("Toggle Details") {
                   withAnimation {
                       showDetails.toggle()
                   }
               }
               .padding()
           }
       }
}

#Preview {
    Creating_Custom_Transitions()
}

// MARK: - Slide and Fade
// This transition moves the view from the bottom while fading it in, and moves it to the top while fading it out.
extension AnyTransition {
    static var slideAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .bottom).combined(with: .opacity)
        let removal = AnyTransition.move(edge: .top).combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

// MARK: - Rotate and Fade
// This transition rotates the view by 90 degrees while fading it in and out.
extension AnyTransition {
    static var rotateAndFade: AnyTransition {
        AnyTransition.modifier(
            active: RotateAndFadeModifier(opacity: 0, angle: 90),
            identity: RotateAndFadeModifier(opacity: 1, angle: 0)
        )
    }
}

struct RotateAndFadeModifier: ViewModifier {
    var opacity: Double
    var angle: Double

    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .rotationEffect(.degrees(angle))
    }
}

// MARK: - Using Custom Transitions with Other Views
// You can use custom transitions with any SwiftUI view that supports transitions, such as Text, Image, Button, etc.

struct ContentViewt: View {
    @State private var showText = false

    var body: some View {
        VStack {
            if showText {
                Text("Hello, World!")
                    .font(.largeTitle)
                    .transition(.rotateAndFade)
                    .animation(.easeInOut(duration: 1.0), value: showText)
            }
            Button("Toggle Text") {
                withAnimation {
                    showText.toggle()
                }
            }
            .padding()
        }
    }
}
