//
//  VSTACK.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 16/11/2025.
//

import SwiftUI

struct VSTACKExample: View {
    var body: some View {
        VStack {
            HStack {
                Text("SwiftUI")
                    .font(.system(size: 28, weight: .bold))
                Spacer()
            }
            HStack {
                Spacer()
                Text("Example")
                    .font(.system(size: 24, weight: .medium))
            }
            
            Button{
                print("Button Tapped")
            } label: {
                Text("Learn more")
                    .padding()
                    .font(.system(size: 18, weight: .heavy))
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color.yellow)
    }
}

#Preview {
    VSTACKExample()
}
