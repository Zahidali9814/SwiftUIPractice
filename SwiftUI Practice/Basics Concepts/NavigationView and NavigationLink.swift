//
//  NavigationView and NavigationLink.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

// NavigationView is used to manage a navigation stack and NavigationLink creates a tappable link that pushes a new view onto the navigation stack.

import SwiftUI

struct NavigationView_and_NavigationLink: View {
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Home View")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: DetailView()) {
                    Text("Go to detail view")
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Home")
        }
    }
}


struct DetailView: View {
    var body: some View {
        VStack{
            Text("Detail View")
                .font(.largeTitle)
                .bold()
                .padding()
        }
    }
}
#Preview {
    NavigationView_and_NavigationLink()
}
