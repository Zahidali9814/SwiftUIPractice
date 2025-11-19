//
//  StateExample02.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 17/08/2025.
//

import SwiftUI

// Parent view
struct Example02: View {
    
    @State private var name: String = ""
    
    var body: some View {
        VStack {
         //   TextField("Enter a name", text: $name)
            ChildViewExample(text: $name)
            Text("My name is \(name)")
        }
        .padding()
    }
}

// Child view
struct ChildViewExample: View {
    
    @Binding var text: String // initial value is not assigned this is rule
    
    var body: some View {
        TextField("Enter a text", text: $text)
    }
}

#Preview {
    Example02()
}
