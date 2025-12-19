//
//  Transition Animations.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

// Transitions animate the appearance and disappearance of views.

import SwiftUI

struct Transition_Animations: View {
    @State private var showDetails = false
    
    var body: some View {
        VStack{
            Spacer()
            if showDetails {
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: 200, height: 200)
                    .transition(.slide)
                    .animation(.easeInOut, value: showDetails)
            }
            
            Spacer()
            Button("Toggle Details"){
                withAnimation {
                    showDetails.toggle()
                }
            }
            .padding()
        }
    }
}

#Preview {
    Transition_Animations()
}
