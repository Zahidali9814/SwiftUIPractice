//
//  ProductModel.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 23/12/2025.
//

import Foundation

struct ProductModel: Codable, Identifiable {
    let id: Int
    let title, description, category, image: String
    let price: Double
    let rating: Rate
    
    static var dummy: ProductModel {
        return ProductModel(id: 1,
                            title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                            description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                            category: "men's clothing",
                            image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                            price: 109.95,
                            rating: Rate(rate: 3.9,
                                         count: 120))
    }
}

struct Rate: Codable {
    let rate: Double
    let count: Int
}
