//
//  WeatherButton.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 15/11/2025.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backGroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backGroundColor.gradient)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
