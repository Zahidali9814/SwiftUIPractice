//
//  StateExample03.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 17/08/2025.
//

import SwiftUI

struct Example03: View {
    
    @State private var isDarkMode: Bool = false
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $isDarkMode) {
                Text("Dark Mode")
                    .foregroundStyle(isDarkMode ? .white : .black)
            }
            
            Button("Open Sheet") {
                showSheet.toggle()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(isDarkMode ? .black : .white)
        .sheet(isPresented: $showSheet) {
           // SheetView() way 01
           // SheetView(dismiss: $showSheet) // way 02
            SheetView(dismiss: $showSheet, isDarkMode: $isDarkMode)
                .presentationDetents([.medium])
        }
    }
}

struct SheetView: View {
    
    // Way 01
//    @Environment(\.dismiss) var dismiss // to dissmiss
    
    // Alternate Way 02 is use binding
    @Binding var dismiss: Bool
    
    // use this also for binding underStanding
    @Binding var isDarkMode: Bool
    
    var body: some View {
        VStack {
            Toggle(isOn: $isDarkMode) {
                Text("Dark Mode")
            }
            
            Button("Dismiss") {
               // dismiss() to use Environment way 01
                dismiss.toggle() // way 02
            }

        }
        .padding()
    }
}


#Preview {
    Example03()
}
