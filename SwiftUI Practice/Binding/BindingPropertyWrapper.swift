//
//  BindingPropertyWrapper.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 14/08/2025.
//

import SwiftUI

struct BindingPropertyWrapper: View {
    
    @State private var isNight = true
    @State private var isShowingSheet = false
    
    var body: some View {
        ZStack {
            Color(isNight ? .black : .systemBlue).ignoresSafeArea()
            
            VStack {
                TimeOfDayImage(imageTitle: isNight ? "moon.stars.fill" : "cloud.sun.fill")

                Button {
                    isShowingSheet = true
                } label: {
                    ButtonLabel(title: "Change Time Of Day", imagenName: "clock.fill", color: .green)
                }
                .padding(.top, 100)
            }
        }
        .sheet(isPresented: $isShowingSheet) {
            ChangeTimeOfDayView(isNight: $isNight)
        }
    }
}


#Preview {
    BindingPropertyWrapper()
}

struct TimeOfDayImage: View {
    
    var imageTitle: String
    
    var body: some View {
        Image(systemName: imageTitle)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
    }
}

struct ButtonLabel: View {
    
    var title: String
    var imagenName: String
    var color: Color
    
    var body: some View {
        Label(title, systemImage: imagenName)
            .frame(width: 280, height: 50)
            .background(color)
            .foregroundStyle(.white)
            .cornerRadius(12)
    }
}
