//
//  DinosaurDetailView.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 8/11/24.
//

import SwiftUI

struct DinosaurDetailView: View {
    @ObservedObject var gameState: GameState
    @ObservedObject var dinosaur: Dinosaur

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
                    
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(dinosaur.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(dinosaur.gender == .male ? Color.blue : Color.pink)
                            .frame(width: 50, height: 50)
                        
                        Text("\(dinosaur.state == .idle ? "Idle" : dinosaur.state == .farming ? "Farming" : "Fighting")")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                
                Text("Currently: \(String(describing: dinosaur.state).uppercased())")
                    .font(.headline)
                
                Text("Type: \(dinosaur.type == .carnivore ? "Carnivore" : "Herbivore")")
                    .font(.headline)
            }
            
            // Inventory Section
            Text("Inventory")
                .font(.headline)
                .padding(.top, 10)
            
            if dinosaur.inventory.isEmpty {
                Text("No items in inventory")
                    .foregroundColor(.secondary)
            } else {
                List {
                    ForEach(dinosaur.inventory.sorted(by: >), id: \.key) { item, quantity in
                        HStack {
                            Text(item)
                            Spacer()
                            Text("\(quantity)")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .listStyle(PlainListStyle()) // Optional: To style the list
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(dinosaur.name)
    }
}

#Preview {
    let sampleGameState = GameState()
    return DinosaurDetailView(
        gameState: sampleGameState,
        dinosaur: sampleGameState.dinosaurs[0]
    )
}
