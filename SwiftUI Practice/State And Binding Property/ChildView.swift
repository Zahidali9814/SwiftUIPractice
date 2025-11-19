//
//  ChildView.swift
//  SwiftUI Practice
//
//  Created by Macbook on 17/08/2025.
//

import SwiftUI

struct ChildView: View {
    
    @Binding var showDetailView: Bool
    @Binding var isDarkModeEnable: Bool
    
    var body: some View {
        VStack{
            Button {
                showDetailView.toggle()
            } label: {
                Text("Dismiss")
            }
            
            Toggle(isOn: $isDarkModeEnable) {
                Text("Dark Mode")
                    .foregroundStyle(isDarkModeEnable ? .white : .black)
            }
        }
        .padding()
    }
}

#Preview {
    ChildView(showDetailView: .constant(false), isDarkModeEnable: .constant(false))
}
