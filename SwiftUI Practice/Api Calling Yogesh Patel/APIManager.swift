//
//  APIManager.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 23/12/2025.
//

import Foundation

enum APIError: Error {
    case invalidurl
    case invalidResponse
}

final class APIManager {
    
    /*
     Error: throw
     response: return
     */
    
    func request<T: Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw APIError.invalidurl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard(response as? HTTPURLResponse)?.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
