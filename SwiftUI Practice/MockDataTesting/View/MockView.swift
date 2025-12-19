//
//  MockView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 19/12/2025.
//

import SwiftUI

struct MockView: View {
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        List(viewModel.users) { user in
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                Text(user.email)
                    .font(.subheadline)
            }
        }
        .onAppear() {
            Task {
                await self.viewModel.loadData()
            }
        }
    }
}

#Preview {
    MockView(viewModel: UserViewModel(service: MockUserService()))
}
