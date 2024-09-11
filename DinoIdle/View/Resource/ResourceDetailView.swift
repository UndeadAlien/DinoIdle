//
//  HarvestDetailView.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 8/13/24.
//

import SwiftUI

struct ResourceDetailView: View {
    @ObservedObject var gameState: GameState
    @ObservedObject var resource: Resource
    @ObservedObject var viewModel: ResourceVM

    var body: some View {
        VStack {
            Text("\(resource.name)")
                .font(.title)
            
            List(resource.attachedDinos, id: \.id) { dino in
                VStack {
                    Text(dino.name)
                        .badge("\(dino.state)")
                    ProgressBarView(dinosaur: dino)
                    DinoInventoryView(dinosaur: dino)
                }
            }

            Text("Available Dinos:")
                .font(.subheadline)
            
            List(gameState.dinosaurs.filter { $0.type == .herbivore && $0.state == .idle }, id: \.id) { dino in
                HStack {
                    Text(dino.name)
                    if resource.attachedDinos.contains(where: { $0.id == dino.id }) {
                        Button("Remove") {
                            viewModel.removeDinoFromResource(dino, resource)
                        }
                    } else {
                        Button("Add") {
                            viewModel.addDinoToResource(dino, resource)
                        }
                    }
                }
            }
        }
    }
}

// Example Preview
#Preview {
    // Create instances of the mock objects
    let gameState = GameState()
    let resource = Resource(name: "Idk", level: 1, harvestAmount: 10, harvestTime: 2)
    let viewModel = ResourceVM()
    
    // Populate mock data for preview
    resource.attachedDinos = [gameState.dinosaurs[0]]
    
    return ResourceDetailView(
        gameState: gameState,
        resource: resource,
        viewModel: viewModel
    )
    .previewLayout(.sizeThatFits)
    .padding()
}
