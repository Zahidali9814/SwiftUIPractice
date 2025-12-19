//
//  Passing Data Using Sheets.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

//When presenting a modal view using sheet, you can also pass data to the destination view through its initializer.

import SwiftUI

struct Passing_Data_Using_Sheets: View {
    @State private var showingDetail = false
    @State private var message = "Hello from home view"
    
    
    var body: some View {
        VStack{
            Text("Home View")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                showingDetail.toggle()
            }) {
                Text("Show Detail View")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showingDetail) {
                DetailViewe(message: message)
            }
        }
    }
}

struct DetailViewe: View {
    var message: String
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    Passing_Data_Using_Sheets()
}
