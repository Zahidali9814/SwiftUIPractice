//
//  ProductViewModel.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 23/12/2025.
//

import Foundation

@Observable 
class ProductViewModel {
    
    var products: [ProductModel] = []
    private let manager = APIManager()
    
    func fetchProducts() async {
        do {
            products = try await manager.request(url: "https://fakestoreapi.com/products")
            print(products)
        } catch {
            print("Fetch Product error:", error)
        }
    }
}
