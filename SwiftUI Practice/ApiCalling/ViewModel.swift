//
//  NetworkManager.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 19/12/2025.
//

import Foundation
import Combine

enum NetworkError: Error {
    case badURL
    case decodingError
    case other(Error)
}

class ViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    @Published var isLoading = false
    @Published var error: NetworkError?
    private var cancellable: AnyCancellable?
    
    func fetchPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            self.error = .badURL
            return
        }
        isLoading = true
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = .other(error)
                }
            }, receiveValue: { [weak self] posts in
                self?.posts = posts
            })
    }
}
