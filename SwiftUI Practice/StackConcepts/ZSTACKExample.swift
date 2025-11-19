//
//  ZSTACKExample.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 16/11/2025.
//

import SwiftUI

struct ZSTACKExample: View {
    var body: some View {
        ZStack{
            Color.blue.opacity(0.2)
            
            VStack{
                HStack{
                    ZStack{
                        Circle()
                            .fill(.blue)
                            .frame(width: 50, height: 50)
                        Text("ZStack")
                            .foregroundStyle(.white)
                            .font(.system(size: 12, weight: .heavy))
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
        .frame(width: 200, height: 200)
        .cornerRadius(12)
    }
}

#Preview {
    ZSTACKExample()
}
