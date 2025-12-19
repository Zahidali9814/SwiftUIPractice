//
//  Using EnvironmentObject for Shared Data.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 18/12/2025.
//

//For sharing data across multiple views, especially in larger applications, using @EnvironmentObject is a common practice. This approach requires setting up an observable object.

import SwiftUI
import Combine

class UserSettings: ObservableObject {
    @Published var username: String = "User123"
}

struct Using_EnvironmentObject_for_Shared_Data: View {
    @StateObject private var settings = UserSettings()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DetailVie().environmentObject(settings)) {
                    Text("Go to Detail View")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Home")
        }
        .environmentObject(settings)
    }
}

struct DetailVie: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        VStack {
            Text("Username: \(settings.username)")
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle("Detail")
    }
}

#Preview {
    Using_EnvironmentObject_for_Shared_Data()
}

