//
//  ParentView.swift
//  SwiftUI Practice
//
//  Created by Macbook on 17/08/2025.
//

import SwiftUI

struct ParentView: View {
    
    @State private var isDarkModeEnable = false
    @State private var showDetailView = false
    
    var body: some View {
        ZStack {
            Color(isDarkModeEnable ? .black : .white)
            
            VStack {
                Button {
                    showDetailView.toggle()
                } label: {
                    Text("Show Detail View")
                }
            }
            .padding()
        }
        .sheet(isPresented: $showDetailView) {
            ChildView(showDetailView: $showDetailView, isDarkModeEnable: $isDarkModeEnable)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ParentView()
}
