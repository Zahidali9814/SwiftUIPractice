//
//  SwiftUI_PracticeApp.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 01/08/2025.
//

import SwiftUI
import Combine // this is compulsory where we use the @Published property

// for EnvironmentObject code step 1
final class Theme: ObservableObject {
    @Published var primarColor: Color = .orange
}

@main
struct SwiftUI_PracticeApp: App {
    
    @StateObject var currentTheme = Theme() // for EnvironmentObject step 2 create a object
    
    var body: some Scene {
        WindowGroup {
//            ArticlesListView() // step 3 this is root view
//                .environmentObject(currentTheme) // Make the theme available through the environment.
            
            RandomNumberGenerator()
        }
    }
}
