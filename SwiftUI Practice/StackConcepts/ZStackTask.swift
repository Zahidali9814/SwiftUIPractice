//
//  ZStackTask.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 16/11/2025.
//

import SwiftUI

struct ZStackTask: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                           .fill(Color.white)
                           .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 0)
            VStack{
                ZStack {
                    Circle()
                        .foregroundStyle(Color.blue.opacity(0.2))
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundStyle(.blue)
                        .frame(width: 60, height: 60)
                }
                .frame(width: 120, height: 120)
                
                VStack(spacing: 10){
                    Text("John Doe")
                        .font(.system(size: 28, weight: .bold))
                    Text("iOS Developer")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.gray)
                }
                .padding()
                
                HStack(spacing: 16){
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    Button {
                        
                    } label: {
                        Text("Message")
                            .padding()
                            .foregroundStyle(.black)
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
        .frame(width: 270, height: 330)
    }
}

#Preview {
    ZStackTask()
}
