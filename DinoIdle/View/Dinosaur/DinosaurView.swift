//
//  DinosaurView.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 8/11/24.
//

import SwiftUI

struct DinosaurView: View {
    @ObservedObject var gameState: GameState
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(gameState.dinosaurs) { dinosaur in
                    NavigationLink(destination: DinosaurDetailView(gameState: gameState, dinosaur: dinosaur)) {
                        VStack(alignment: .leading) {
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(dinosaur.gender == .male ? .blue : .pink)
                                        .frame(width: 32, height: 32)
                                }
                                HStack {
                                    Text("\(dinosaur.name)")
                                        .font(.headline)
                                        .bold()
                                        .padding(.horizontal, 5)
                                    Text("\(dinosaur.gender == .male ? "♂" : "♀")")
                                        .font(.title)
                                        .foregroundStyle(dinosaur.gender == .male ? .blue : .pink)
                                }
                            }
                            .badge("\(dinosaur.state)")
                        }
                        .padding(.vertical, 15)
                    }
                }
            }
            .navigationTitle("Dinosaurs")
            .listStyle(InsetGroupedListStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensures proper layout on all devices
    }
}

#Preview {
    let sampleGameState = GameState()
    return DinosaurView(gameState: sampleGameState)
        .preferredColorScheme(.dark)
}
