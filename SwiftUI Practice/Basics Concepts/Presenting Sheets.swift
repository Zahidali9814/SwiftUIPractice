//
//  Presenting Sheets.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

// You can present a modal view (sheet) using the sheet modifier.

import SwiftUI

struct Presenting_Sheets: View {
    
    @State private var showingDetail = false
    
    var body: some View {
        VStack {
            Text("Home View")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                showingDetail.toggle()
            }) {
                Text("Show detail view")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showingDetail) {
                DetailViews()
            }
        }
    }
}

struct DetailViews: View {
    var body: some View {
        VStack{
            Text("Detail view")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    Presenting_Sheets()
}
