//
//  ProductRowView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 23/12/2025.
//

import SwiftUI

struct  ProductRowView: View {
    
    let product: ProductModel
    
    var body: some View {
        HStack(spacing: 8) {
            if let url = URL(string: product.image) {
                productImage(url: url)
            }
            
            // Title
            VStack(alignment: .leading, spacing: 8 ){
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                
                // Category and Rating
                HStack {
                    Text(product.category )
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    HStack{
                        Image(systemName: "star.fill")
                        Text(product.rating.rate.toString())
                    }
                    .fontWeight(.medium)
                    .foregroundStyle(.yellow)
                }
                
                // Description
                Text(product.description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                
                // Price and Buy Button
                HStack {
                    Text(product.price.currencyFormat())
                        .font(.title3)
                        .foregroundStyle(.indigo)
                    
                    Spacer()
                    
                    buyButton
                }
            }
        }
        .padding()
    }
    
    var buyButton: some View {
        Button(action: { }) {
            Text("Buy")
                .foregroundStyle(.white)
                .padding(.horizontal)
                .padding(.vertical, 4)
                .background(.indigo)
                .clipShape(Capsule())
        }
    }
    func productImage(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 100 )
    }
}

#Preview {
    ProductRowView(product: ProductModel.dummy)
}
