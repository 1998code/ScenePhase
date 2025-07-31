//
//  ContentView.swift
//  ScenePhase
//
//  Created by Ming on 6/9/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        ZStack {
            background
            active
            if scenePhase == .inactive {
                if #available(iOS 26.0, *) {
                    inactiveGlass
                } else {
                    inactive
                }
            }
        }
    }

    var background: some View {
        LinearGradient(colors: [.mint.opacity(0.55), .indigo.opacity(0.15)], startPoint: .top, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
    
    var active: some View {
        ShimmerText("Can you see me?")
            .padding()
    }
    
    var inactive: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ShimmerText("You cannot see me!")
                    .font(.largeTitle)
                Spacer()
            }
            Spacer()
        }.background(.ultraThinMaterial)
        .ignoresSafeArea()
    }
    
    @available(iOS 26.0, *)
    var inactiveGlass: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ShimmerText("You cannot see me!")
                    .font(.largeTitle)
                Spacer()
            }
            Spacer()
        }.glassEffect(in: .rect)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
