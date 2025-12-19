//
//  GlassAnimations.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 09/12/2025.
//

import SwiftUI

// MARK: - Main View
struct GlassAnimations: View {
    @State private var isExpanded = false
    @State private var selectedLabel = ""
    @State private var bubbles: [Bubble] = []
    @State private var labelTopPosition: CGFloat = 0
    
    var body: some View {
        ZStack {
            backgroundGradient
            
            VStack {
                Spacer()
                
                // Animated bubbles above title
                ZStack {
                    ForEach(bubbles) { bubble in
                        BubbleView(bubble: bubble)
                            .offset(y: bubble.yOffset)
                            .opacity(bubble.opacity)
                    }
                }
                .frame(height: 200)
                
                // Title Label
                labelView
                    .padding(.bottom, 50)
                
                // Glass Buttons
                buttonRow
                    .padding(.horizontal, 40)
                    .padding(.bottom, 50)
            }
        }
        .onAppear(perform: startAnimation)
    }
    
    // MARK: - Subviews
    private var backgroundGradient: some View {
        LinearGradient(
            colors: GradientColors.background,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private var labelView: some View {
        if !selectedLabel.isEmpty {
            Text(selectedLabel)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.black)
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.ultraThinMaterial)
                        .shadow(color: .black.opacity(0.2), radius: 20)
                )
                .animation(.spring(response: 0.4), value: selectedLabel)
        }
    }
    
    private var buttonRow: some View {
        HStack(spacing: isExpanded ? 30 : 10) {
            ForEach(ButtonData.allButtons) { button in
                GlassButton(
                    icon: button.icon,
                    colors: button.colors,
                    action: { handleButtonTap(button.label) }
                )
            }
        }
    }
    
    // MARK: - Actions
    private func startAnimation() {
        withAnimation(
            .easeInOut(duration: 1.5)
            .repeatForever(autoreverses: true)
        ) {
            isExpanded.toggle()
        }
        
        // Start continuous bubbles
        startContinuousBubbles()
    }
    
    private func startContinuousBubbles() {
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
            createBubbles()
        }
        // Create first batch immediately
        createBubbles()
    }
    
    private func handleButtonTap(_ label: String) {
        selectedLabel = label
        // Create extra bubbles on tap
        createBubbles()
    }
    
    private func createBubbles() {
        let bubbleCount = Int.random(in: 5...8)
        let centerX = UIScreen.main.bounds.width / 2
        
        for i in 0..<bubbleCount {
            let delay = Double(i) * 0.08
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                let spread = CGFloat.random(in: -150...150)
                let size = CGFloat.random(in: 30...90)
                let speed = Double.random(in: 3.0...5.0) // Slow like snowfall
                
                let newBubble = Bubble(
                    size: size,
                    xPosition: centerX + spread,
                    colors: BubbleColors.random,
                    yOffset: -200,
                    opacity: 1.0
                )
                
                bubbles.append(newBubble)
                
                // Animate with slow speed like snowfall
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    if let index = bubbles.firstIndex(where: { $0.id == newBubble.id }) {
                        withAnimation(.linear(duration: speed)) {
                            bubbles[index].yOffset = 180
                            bubbles[index].opacity = 0.0
                        }
                    }
                }
                
                // Remove bubble
                DispatchQueue.main.asyncAfter(deadline: .now() + speed + 0.5) {
                    bubbles.removeAll { $0.id == newBubble.id }
                }
            }
        }
    }
}

// MARK: - Glass Button Component
struct GlassButton: View {
    let icon: String
    let colors: [Color]
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: colors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .opacity(0.3)
                
                Circle()
                    .fill(.ultraThinMaterial)
                
                Image(systemName: icon)
                    .font(.system(size: 32))
                    .foregroundStyle(
                        LinearGradient(
                            colors: colors,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
            .frame(width: 70, height: 70)
            .shadow(color: colors[0].opacity(0.4), radius: 15, x: 0, y: 8)
        }
    }
}

// MARK: - Bubble View
struct BubbleView: View {
    let bubble: Bubble
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(
                    LinearGradient(
                        colors: bubble.colors,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 5
                )
                .background(
                    Circle()
                        .fill(.ultraThinMaterial.opacity(0.5))
                )
                .shadow(color: bubble.colors[0].opacity(0.5), radius: 15)
        }
        .frame(width: bubble.size, height: bubble.size)
        .position(x: bubble.xPosition, y: 0)
    }
}

// MARK: - Models
struct ButtonModel: Identifiable {
    let id = UUID()
    let icon: String
    let colors: [Color]
    let label: String
}

struct Bubble: Identifiable {
    let id = UUID()
    let size: CGFloat
    let xPosition: CGFloat
    let colors: [Color]
    var yOffset: CGFloat
    var opacity: Double
}

// MARK: - Constants
private enum GradientColors {
    static let background: [Color] = [
        Color(red: 0.4, green: 0.6, blue: 1.0),
        Color(red: 0.6, green: 0.8, blue: 1.0),
        Color(red: 1.0, green: 0.7, blue: 0.8),
        Color(red: 1.0, green: 0.8, blue: 0.6)
    ]
}

private enum ButtonData {
    static let allButtons: [ButtonModel] = [
        ButtonModel(icon: "scribble.variable", colors: [.cyan, .blue], label: "Zahid Ali Awan"),
        ButtonModel(icon: "eraser.fill", colors: [.mint, .green], label: "iOS Developer"),
        ButtonModel(icon: "paintbrush.fill", colors: [.pink, .purple], label: "SwiftUI"),
        ButtonModel(icon: "pencil.tip", colors: [.orange, .red], label: "Creative Designer")
    ]
}

private enum BubbleColors {
    static let gradients: [[Color]] = [
        // Light colors
        [.pink.opacity(0.7), .purple.opacity(0.5)],
        [.cyan.opacity(0.6), .blue.opacity(0.4)],
        [.mint.opacity(0.7), .green.opacity(0.5)],
        [.yellow.opacity(0.6), .orange.opacity(0.5)],
        [.white.opacity(0.8), .cyan.opacity(0.4)],
        [.pink.opacity(0.5), .white.opacity(0.7)],
        // Dark colors mixed in
        [.indigo, .purple],
        [.blue, .cyan],
        [.teal, .green],
        [.orange, .red],
        [.purple, .pink]
    ]
    
    static var random: [Color] {
        gradients.randomElement() ?? [.blue.opacity(0.5), .purple.opacity(0.5)]
    }
}

#Preview {
    GlassAnimations()
}
