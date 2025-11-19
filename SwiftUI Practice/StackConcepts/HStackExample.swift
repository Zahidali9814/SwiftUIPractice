//
//  HStackExample.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 16/11/2025.
//

import SwiftUI

struct HStackExample: View {
    var body: some View {
        HStack{
            Image(systemName: "house.fill")
                .foregroundStyle(.blue)
                .font(.largeTitle)
            Spacer()
            Text("Home")
                .font(.system(size: 28, weight: .bold))
        }
        .padding()
        .background(LinearGradient(colors: [.yellow, .red], startPoint: .leading, endPoint: .trailing))
    }
}

#Preview {
    HStackExample()
}
