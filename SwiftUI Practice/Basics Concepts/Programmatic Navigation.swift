//
//  Programmatic Navigation.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

import SwiftUI

struct Programmatic_Navigation: View {
    
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                Text("Home View")
                    .font(.largeTitle)
                    .padding()
                
                Button(action: {
                    navigationPath.append("Details")
                }) {
                    Text("Go to detail view")
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: String.self) { value in
                if value == "Details" {
                    DetailsView()
                }
            }
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
