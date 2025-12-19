//
//  Programmatic Navigation.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

// SwiftUI allows for programmatic navigation using NavigationLink with a @State variable to control the navigation.

import SwiftUI

struct Programmatic_Navigation: View {
    
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Home View")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: DetailsView(), isActive: $isActive) {
                    EmptyView()
                }
                
                Button(action: {
                    isActive = true
                }) {
                    Text("Go to detail view")
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct DetailsView: View {
    var body: some View {
        VStack {
            Text("Detail View")
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle("Detail")
    }
}

#Preview {
    Programmatic_Navigation()
}
