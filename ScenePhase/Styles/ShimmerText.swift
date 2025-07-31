//
//  ShimmerText.swift
//  ScenePhase
//
//  Created by Ming on 6/9/2022.
//

import SwiftUI

struct ShimmerText: View {
    let text: String
    let font: Font
    let primaryColor: Color
    let shimmerColor: Color
    let animationDuration: Double
    
    @State private var isAnimating = false
    
    init(
        _ text: String,
        font: Font = .largeTitle,
        primaryColor: Color = .primary,
        shimmerColor: Color = .white,
        animationDuration: Double = 2.0
    ) {
        self.text = text
        self.font = font
        self.primaryColor = primaryColor
        self.shimmerColor = shimmerColor
        self.animationDuration = animationDuration
    }
    
    var body: some View {
        ZStack {
            // Base text
            Text(text)
                .bold()
                .font(font)
                .foregroundColor(primaryColor)
                .opacity(0.3)
            
            // Shimmer overlay
            Text(text)
                .bold()
                .font(font)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .clear,
                            shimmerColor.opacity(0.5),
                            shimmerColor,
                            shimmerColor.opacity(0.5),
                            .clear
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .mask(
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    .clear,
                                    .white.opacity(0.1),
                                    .white,
                                    .white.opacity(0.1),
                                    .clear
                                ],
                                startPoint: UnitPoint(x: isAnimating ? 1.5 : -0.5, y: 0),
                                endPoint: UnitPoint(x: isAnimating ? 2.5 : 0.5, y: 0)
                            )
                        )
                )
        }
        .onAppear {
            withAnimation(
                .linear(duration: animationDuration)
                .repeatForever(autoreverses: false)
            ) {
                isAnimating = true
            }
        }
    }
}

// Alternative shimmer effect with more pronounced animation
struct ShimmerTextV2: View {
    let text: String
    let font: Font
    let baseColor: Color
    let shimmerColor: Color
    
    @State private var animationPhase: CGFloat = 0
    
    init(
        _ text: String,
        font: Font = .largeTitle,
        baseColor: Color = .primary,
        shimmerColor: Color = .white
    ) {
        self.text = text
        self.font = font
        self.baseColor = baseColor
        self.shimmerColor = shimmerColor
    }
    
    var body: some View {
        Text(text)
            .font(font)
            .foregroundStyle(
                LinearGradient(
                    colors: [
                        baseColor,
                        shimmerColor,
                        baseColor
                    ],
                    startPoint: UnitPoint(x: animationPhase - 0.3, y: 0),
                    endPoint: UnitPoint(x: animationPhase + 0.3, y: 0)
                )
            )
            .onAppear {
                withAnimation(
                    .linear(duration: 2.0)
                    .repeatForever(autoreverses: false)
                ) {
                    animationPhase = 1.0
                }
            }
    }
}

// Preview
struct ShimmerText_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            ShimmerText("Shimmer Effect")
                .font(.largeTitle)
            
            ShimmerText("Beautiful Animation", font: .title, primaryColor: .blue, shimmerColor: .cyan)
            
            ShimmerTextV2("Alternative Style", font: .title2, baseColor: .purple, shimmerColor: .pink)
        }
        .padding()
        .background(Color.black)
        .preferredColorScheme(.dark)
    }
} 
