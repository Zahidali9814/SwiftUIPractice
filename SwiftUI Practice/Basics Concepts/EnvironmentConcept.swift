//
//  EnvironmentConcept.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

///Accesses system-provided or parent-provided environment values.
///Typically used for system settings or configurations like color schemes, locales, etc.
///Does not allow modification of the environment value itself.

//Usage: @Environment is used to access values stored in the environment of the view hierarchy. These values are often provided by the system or by parent views, and they include settings like color schemes, layouts, locale settings, and more.

import SwiftUI

struct EnvironmentConcept: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text("Hello SwiftUI!")
            .padding()
            .background(colorScheme == .dark ? Color.black : Color.white)
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
    }
}

#Preview {
    EnvironmentConcept()
}
