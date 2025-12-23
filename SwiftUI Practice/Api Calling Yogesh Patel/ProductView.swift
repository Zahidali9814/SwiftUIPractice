//
//  ProductView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 23/12/2025.
//

import SwiftUI

struct ProductView: View {
    
    private let viewModel = ProductViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.products) { product in
                ProductRowView(product: product)
            }
            .navigationTitle("Products")
            .listStyle(.plain)
        }
        .task {
            await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductView()
}
