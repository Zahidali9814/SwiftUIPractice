//
//  ArticlesListView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 20/12/2025.
//

import SwiftUI

struct ArticlesListView: View {
    
    @EnvironmentObject var theme: Theme // create a reference
    
    var body: some View {
        Text("Hello, World!")
            .foregroundStyle(theme.primarColor)
    }
}

#Preview {
    ArticlesListView()
        .environmentObject(Theme())
}
