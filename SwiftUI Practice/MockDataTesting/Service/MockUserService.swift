//
//  MockUserService.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 19/12/2025.
//

import Foundation

class MockUserService: UserServiceProtocol {
    
    func fetchUser() async throws -> [UserModel] {
        loadMockUsers()
    }
    
    private func loadMockUsers() -> [UserModel] {
        guard let url = Bundle.main.url(forResource: "mock_users", withExtension: "json"),
                let data = try? Data(contentsOf: url),
                let users = try? JSONDecoder().decode([UserModel].self, from: data) else {
            return []
        }
        return users
    }
}
