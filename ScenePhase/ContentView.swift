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
            VStack(spacing: 15) {
                Image(systemName: "person.circle.fill")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Can you see me?")
            }
            .padding()
            if scenePhase == .inactive {
                inactive
            }
        }
    }
    
    var inactive: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("You cannot see me!")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                Spacer()
            }
            Spacer()
        }.background(.ultraThinMaterial)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
