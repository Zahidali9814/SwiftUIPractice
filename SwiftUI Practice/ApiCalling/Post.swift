//
//  PostModel.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 19/12/2025.
//

import Foundation

struct Post: Codable, Identifiable {
    
    let id: Int
    let title: String
    let body: String
}
