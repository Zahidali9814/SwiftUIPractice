//
//  StateAndBinding.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 16/08/2025.
//

import SwiftUI

struct StateView: View {
    
    @State private var isDarkModeEnabled = false
    
    var body: some View {
        ZStack {
            Color(isDarkModeEnabled ? .black : .white)
            VStack{
                Toggle(isOn: $isDarkModeEnabled) {
                    Text("Dark Mode")
                        .foregroundStyle(isDarkModeEnabled ? .white : .black)
                }
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    StateView()
}
