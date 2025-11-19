//
//  APiCalling.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 15/11/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user: GitHubUser?
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: user?.avatarUrl ?? "" )) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
            .frame(width: 100, height: 100)
            
            Text(user?.login ?? "")
                .font(.title3)
                .bold()
            
            Text(user?.bio ?? "")
                .padding()
            Spacer()
        }
        .padding()
        .task {
            do {
                user = try await getUser()
            } catch GitHubError.invalidData {
                print("invalidData")
            } catch GitHubError.invalidResponse {
                print("invalidResponse")
            } catch GitHubError.invalidUrl {
                print("invalidUrl")
            } catch {
                print("Unexpectd Error")
            }
        }
    }
}

// MARK: - function
func getUser() async throws -> GitHubUser {
    let endpoint = "https://api.github.com/users/twostraws"
    guard let url = URL(string: endpoint) else {
        throw GitHubError.invalidUrl
    }
    let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw GitHubError.invalidResponse
    }
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(GitHubUser.self, from: data)
    } catch {
        throw GitHubError.invalidData
    }
}

#Preview {
    ContentView()
}

// MARK: - Model
struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String
    let bio: String
}

// MARK: - enum for error
enum GitHubError: Error {
    case invalidResponse
    case invalidData
    case invalidUrl
}
