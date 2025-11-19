//
//  ChangeTimeOfDayView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 14/08/2025.
//

import SwiftUI

struct ChangeTimeOfDayView: View {
    
    @Binding var isNight: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                isNight = true
                presentationMode.wrappedValue.dismiss()
            } label: {
                ButtonLabel(title: "Make Night", imagenName: "moon.stars.fill", color: .black)
            }
            
            Button {
                isNight = false
                presentationMode.wrappedValue.dismiss()
            } label: {
                ButtonLabel(title: "Make Day", imagenName: "cloud.sun.fill", color: .blue)
            }
        }
    }
}


#Preview {
    ChangeTimeOfDayView(isNight: .constant(false))
}
