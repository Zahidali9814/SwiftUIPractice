//
//  UserModel.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 19/12/2025.
//

import Foundation

struct UserModel: Codable, Identifiable {
    
    let id: Int
    let name: String
    let email: String
}
