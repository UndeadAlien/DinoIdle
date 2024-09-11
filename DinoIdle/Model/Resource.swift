//
//  Resource.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 9/5/24.
//

import Foundation
import Combine

class Resource: Identifiable, ObservableObject {
    var id = UUID()
    @Published var name: String
    @Published var level: Int
    @Published var harvestAmount: Int
    @Published var harvestTime: TimeInterval
    @Published var attachedDinos: [Dinosaur] = []

    init(name: String, level: Int, harvestAmount: Int, harvestTime: TimeInterval) {
        self.name = name
        self.level = level
        self.harvestAmount = harvestAmount
        self.harvestTime = harvestTime
    }
    
    func addDino(_ dino: Dinosaur) {
        attachedDinos.append(dino)
    }
    
    func removeDino(_ dino: Dinosaur) {
        attachedDinos.removeAll { $0.id == dino.id }
    }
}

