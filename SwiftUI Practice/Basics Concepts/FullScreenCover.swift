//
//  FullScreenCover.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

// For full-screen modal presentations, use the fullScreenCover modifier.

import SwiftUI

struct FullScreenCover: View {
    @State private var showingDetail = false
    
    var body: some View {
        VStack {
            Text("Home View")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                showingDetail.toggle()
            }) {
                Text("Show Detail View Fullscreen")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $showingDetail) {
                DetailViewss()
            }
        }
    }
}

struct DetailViewss: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Detail View")
                .font(.largeTitle)
                .padding()

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    FullScreenCover()
}
