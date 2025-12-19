//
//  Passing Data Using NavigationLink.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

// When using NavigationLink for navigation, you can pass data directly to the destination view through its initializer.

import SwiftUI

struct Passing_Data_Using_NavigationLink: View {
    
    var body: some View {
           NavigationView {
               VStack {
                   NavigationLink(destination: DetailVieww(message: "Hello from Home View!")) {
                       Text("Go to Detail View")
                           .padding()
                           .background(Color.blue)
                           .foregroundColor(.white)
                           .cornerRadius(10)
                   }
               }
               .navigationTitle("Home")
           }
       }
}

struct DetailVieww: View {
    var message: String

    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle("Detail")
    }
}

#Preview {
    Passing_Data_Using_NavigationLink()
}
