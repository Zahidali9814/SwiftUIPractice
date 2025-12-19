//
//  SwiftUI Essentials.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

import SwiftUI

struct SwiftUI_Essentials: View {
    var body: some View {
        
        // MARK: - Text:
        Text("Welcome to SwiftUI")
            .font(.title)
            .padding()
        
        // MARK: - Image
        //        Image("logo")
        //            .resizable()
        //            .aspectRatio(contentMode: .fit)
        //            .padding()
        //
        // MARK: - Button
        Button("tap me!") {
            print("Button was tapped")
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        Spacer(minLength: 20)
        
        // MARK: - Stacks:
        VStack {
            Text("Zahid")
            Text("Ali")
        }
        Spacer()
            .frame(height: 30)
        
        
        HStack{
            Text("First")
            Spacer()
            Text("Second")
        }
        .padding()
        
        // MARK: - Frame and Padding Modifiers
        Text("Hello swiftUI world")
            .frame(width: 200, height: 100)
            .border(Color.black)
            .padding()
        Spacer()
    }
}

#Preview {
    SwiftUI_Essentials()
}
