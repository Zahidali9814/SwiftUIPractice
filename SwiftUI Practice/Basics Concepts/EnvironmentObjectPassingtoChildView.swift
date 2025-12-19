//
//  EnvironmentObjectConcept.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

///Provides a way to share and observe a data model across many views.
///Useful for global app state or shared data that needs to be accessed and modified by multiple views.
///Requires the object to be provided by an ancestor view using .environmentObject().

//Usage: @EnvironmentObject is used to create a shared data source that multiple views can access and observe for changes. It is particularly useful for global app state or data models that need to be accessed by many views without explicitly passing the data down the view hierarchy.

//Provides shared data to multiple views.
//The data is injected by an ancestor view.
//Use for global state or shared data that many views need access to.

import SwiftUI
import Combine

class AppSettings: ObservableObject {
    
    @Published var isDarkMode = false
}

struct RootView: View {
    @StateObject private var settings = AppSettings()
    
    var body: some View {
        NavigationView {
            EnvironmentObjectConcept()
                .environmentObject(settings)
        }
    }
}

struct EnvironmentObjectConcept: View {
    
    @EnvironmentObject var settings: AppSettings
    
    var body: some View {
        VStack {
            Text("Dark Mode: \(settings.isDarkMode ? "On" : "Off")")
            Toggle("Dark Mode", isOn: $settings.isDarkMode)
                .padding()
        }
    }
}

#Preview {
    RootView()
}
