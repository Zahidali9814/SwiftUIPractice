//
//  UserViewModel.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 19/12/2025.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    @Published var users: [UserModel] = []
    private let service: UserServiceProtocol
    
    init(service: UserServiceProtocol) {
        self.service = service
    }
    
    func loadData() async {
        if let usersData = try? await service.fetchUser() {
            await MainActor.run {
                self.users = usersData
            }
        }
    }
}
