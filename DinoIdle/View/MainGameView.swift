//
//  MainGameView.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 8/11/24.
//

import SwiftUI

struct MainGameView: View {
    @ObservedObject var gameState: GameState // Observable GameState

    var body: some View {
        List {
            ForEach(gameState.dinosaurs.filter { $0.state != .idle }, id: \.id) { dinosaur in
                VStack(alignment: .leading) {
                    DinoTileView(dinosaur: dinosaur)
                    DinoProgress(dino: dinosaur)
                    DinoInventoryView(dinosaur: dinosaur)
                }
                .padding(.vertical, 15)
            }
        }
        .navigationTitle("Active Dinos")
    }
}

struct DinoProgress: View {
    @ObservedObject var dino: Dinosaur
    
    var body: some View {
        ProgressView("", value: dino.progress, total: 1.0)
            .progressViewStyle(LinearProgressViewStyle())
            .frame(height: 20)
    }
}

struct DinoTileView: View {
    @ObservedObject var dinosaur: Dinosaur

    var body: some View {
        HStack {
            Text("\(dinosaur.name)")
                .font(.title2)
                .bold()
                .padding(.horizontal, 5)
            Text("\(dinosaur.gender == .male ? "♂" : "♀")")
                .font(.title)
                .foregroundStyle(dinosaur.gender == .male ? .blue : .pink)
        }
        .badge("\(dinosaur.state)")
    }
}

struct DinoInventoryView: View {
    @ObservedObject var dinosaur: Dinosaur

    var body: some View {
        if dinosaur.inventory.isEmpty {
            Text("No items in inventory")
                .font(.subheadline)
                .foregroundColor(.gray)
        } else {
            ForEach(dinosaur.inventory.sorted(by: >), id: \.key) { item, quantity in
                Text(item)
                    .badge("\(quantity)")
            }
        }
    }
}

#Preview {
    let sampleGS = GameState()
    
    // Create a new dinosaur
    let dino1 = Dinosaur(
        name: "Testing",
        gender: Dinosaur.DinoGender.male,
        type: Dinosaur.DinoType.carnivore
    )
    
    // Set the state of the dinosaur
    dino1.state = .fighting
    
    // Add items to the dinosaur's inventory
    dino1.inventory["Test Item"] = 10 // Add "Test Item" with quantity 10
    dino1.inventory["Meat"] = 5       // Add "Meat" with quantity 5
    dino1.inventory["Metal"] = 5       // Add "Meat" with quantity 5
    
    // Add the dinosaur to the game state
    sampleGS.dinosaurs.append(dino1)
    
    return MainGameView(gameState: sampleGS)
        .preferredColorScheme(.dark)
}

