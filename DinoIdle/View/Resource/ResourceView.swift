//
//  HarvestView.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 8/11/24.
//

import SwiftUI

class ResourceVM: ObservableObject {
    func addDinoToResource(_ dino: Dinosaur, _ resource: Resource) {
        resource.addDino(dino)
        dino.startHarvesting(on: resource)
    }
    
    func removeDinoFromResource(_ dino: Dinosaur, _ resource: Resource) {
        resource.removeDino(dino)
        dino.stopHarvesting()
    }
}

struct ResourceView: View {
    @ObservedObject var gameState: GameState
    var viewModel = ResourceVM()

    var body: some View {
        NavigationView {
            List {
                ForEach(groupedResources(), id: \.key) { level, resources in
                    ResourceSection(level: level, resources: resources, gameState: gameState, viewModel: viewModel)
                }
            }
            .navigationTitle("Resources")
        }
    }

    private func groupedResources() -> [(key: Int, value: [Resource])] {
        return Dictionary(grouping: gameState.resources, by: { $0.level })
            .sorted(by: { $0.key < $1.key })
    }
}

struct ResourceSection: View {
    let level: Int
    let resources: [Resource]
    let gameState: GameState
    let viewModel: ResourceVM

    var body: some View {
        Section(header: Text("Level \(level)").font(.headline)) {
            ForEach(resources.sorted(by: { $0.name < $1.name }), id: \.id) { resource in
                NavigationLink(destination:
                                ResourceDetailView(
                                    gameState: gameState,
                                    resource: resource,
                                    viewModel: viewModel
                                )
                ) {
                    ResourceRow(resource: resource)
                }
            }
        }
    }
}

struct ResourceRow: View {
    @ObservedObject var resource: Resource

    var body: some View {
        Text("\(resource.name)")
            .font(.title2)
            .badge("(\(resource.attachedDinos.count)) Level \(resource.level)")
    }
}

#Preview {
    let sampleGS = GameState()
    let vm = ResourceVM()
    return ResourceView(gameState: sampleGS, viewModel: vm)
        .preferredColorScheme(.dark)
}

