//
//  Alerts.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 21/12/2025.
//

import SwiftUI

struct Alerts: View {
    @State private var isShowingBasicAlert = false
    @State private var isShowingEnterDataAlert = false
    @State private var stringValue = ""
    @State private var isShowingLoginAlert = false
    @State private var error: MyAppError = .noInternetConnection
    
    var body: some View {
        VStack (spacing: 40) {
            
            // MARK: - isShowingBasicAlert Button 01
            Button("Fetch Data") {
                isShowingBasicAlert = true
            }
            .alert("Network Error", isPresented: $isShowingBasicAlert) {
                Button("Try Again") {
                    // Do Try again code
                }
                
                Button("Delete", role: .destructive) {
                    // DO delete code
                }
                
                Button("Cancel", role: .cancel) { }
                
            } message: {
                Text("No network detected. Connect to wifi or cellular data and try again.")
            }
            
            // MARK: - isShowingEnterDataAlert Button 02
            Button("Enter Data") {
                isShowingEnterDataAlert = true
            }
            .alert("Enter Value", isPresented: $isShowingEnterDataAlert) {
                TextField("Value", text: $stringValue)
                Button("Submit") {
                    // DO code
                }
                Button("Cancel", role: .cancel) {
                    
                }
            } message: {
                Text("Enter the value of your item.")
            }
            
            
            // MARK: - isShowingLoginAlert Button 3
            Button("Log in") {
                error = .invalidUserName // change and see the magic
                isShowingLoginAlert = true
            }
            .alert(isPresented: $isShowingLoginAlert, error: error) { error in
                if error == .invalidUserName {
                    TextField("UserName", text: $stringValue)
                    Button("Submit") {
                        //
                    }
                    Button("Cancel", role: .cancel) {
                        
                    }
                    
                }
            } message: { error in
                Text(error.failureReason)
            }
        }
    }
}

#Preview {
    Alerts()
} 

enum MyAppError: LocalizedError {
    
    case noInternetConnection
    case invalidUserName
    case invalidPassword
    
    var errorDescription: String? {
        switch self {
        case .invalidPassword:
            "invalidPassword"
        case.invalidUserName:
            "invalidUserName"
        case .noInternetConnection:
            "noInternetConnection"
        }
    }
    
    var failureReason: String {
        switch self {
        case .invalidPassword:
            "You have entered invalid Password."
        case .invalidUserName:
            "You have entered invalid UserName."
        case .noInternetConnection:
            "Please connect to wifi or internect connection."
        }
    }
}
