//
//  Example04.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 17/08/2025.
//

import SwiftUI

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    var isFavorite: Bool = false
}

struct Example04: View {
    
    @State private var movies: [Movie] = [
        Movie(title: "Zahid"),
        Movie(title: "Ali"),
        Movie(title: "Awan"),
        Movie(title: "Malik")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                List($movies) { $movie in
                    MovieRowView(movie: $movie)
                }
            }
            Text("Favorites: \(movies.filter{ $0.isFavorite }.count)")
                .font(.headline)
                .padding()
            .navigationTitle("Movies")
        }
    }
}

struct MovieRowView: View {
    
   @Binding var movie: Movie
    
    var body: some View {
        HStack {
            Text(movie.title)
            
            Spacer()
            
            Button {
                movie.isFavorite.toggle()
            } label: {
                Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(movie.isFavorite ? .red : .gray)
            }
            .buttonStyle(.borderless)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    Example04()
}
