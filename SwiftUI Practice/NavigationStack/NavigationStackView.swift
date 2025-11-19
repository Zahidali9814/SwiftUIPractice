//
//  ContentView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 01/08/2025.
//

import SwiftUI

struct NavigationStackView: View {
    
    var platforms: [Platform] = [.init(name: "Xbox", imageName: "xc", color: .green),
                                 .init(name: "PC", imageName: "pc", color: .indigo),
                                 .init(name: "Mobile", imageName: "mo", color: .mint)
    ]
    var games: [Game] = [.init(name: "Minecraft", rating: "99"),
                         .init(name: "Gof of war", rating: "98"),
                         .init(name: "Fortnite", rating: "92"),
                         .init(name: "Madden 2023", rating: "88")
        
    ]
    
    var body: some View {
        NavigationStack{
            List {
                Section("PLATFORMS") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundStyle(platform.color)
                        }
                    }
                }
                Section("Games") {
                    ForEach(games, id: \.name) { game in
                        NavigationLink(value: game) {
                            Text(game.name)
                        }
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self) { platform in
                ZStack{
                    platform.color.ignoresSafeArea()
                    VStack {
                        Label(platform.name, systemImage: platform.imageName)
                            .font(.largeTitle).bold()
                        List {
                            ForEach(games, id: \.name) { game in
                                NavigationLink(value: game) {
                                    Text(game.name)
                                }
                            }
                        }
                        
                    }
                }
            }
            .navigationDestination(for: Game.self) { game in
                Text("\(game.name) - \(game.rating)")
                    .font(.largeTitle).bold()
            }
        }
    }
}

#Preview {
    NavigationStackView()
}


struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}

struct Game: Hashable {
    let name: String
    let rating: String
}
