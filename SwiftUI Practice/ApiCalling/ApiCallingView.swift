//
//  ApiCallingView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 19/12/2025.
//

import SwiftUI

struct ApiCallingView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                } else {
                    List(viewModel.posts) { post in
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.headline)
                            Text(post.body)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.fetchPosts()
            }
        }
    }
}

#Preview {
    ApiCallingView()
}
