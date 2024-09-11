//
//  GameState.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 8/8/24.
//

import Foundation
import Combine

class GameState: ObservableObject {
    @Published var dinosaurs: [Dinosaur]
    @Published var resources: [Resource]
    
    init() {
        // Initialize the dinosaurs from AvailableDinos
        self.dinosaurs = [
            Dinosaur(name: "Tyrannosaurus rex", gender: .male, type: .carnivore),
            Dinosaur(name: "Velociraptor", gender: .female, type: .carnivore),
            Dinosaur(name: "Triceratops", gender: .male, type: .herbivore),
            Dinosaur(name: "Stegosaurus", gender: .female, type: .herbivore),
            Dinosaur(name: "Brachiosaurus", gender: .male, type: .herbivore),
            Dinosaur(name: "Spinosaurus", gender: .female, type: .carnivore),
            Dinosaur(name: "Ankylosaurus", gender: .male, type: .herbivore),
            Dinosaur(name: "Allosaurus", gender: .female, type: .carnivore),
            Dinosaur(name: "Pteranodon", gender: .male, type: .carnivore),
            Dinosaur(name: "Parasaurolophus", gender: .female, type: .herbivore),
            Dinosaur(name: "Iguanodon", gender: .male, type: .herbivore),
            Dinosaur(name: "Diplodocus", gender: .female, type: .herbivore),
            Dinosaur(name: "Carnotaurus", gender: .male, type: .carnivore),
            Dinosaur(name: "Giganotosaurus", gender: .female, type: .carnivore),
            Dinosaur(name: "Corythosaurus", gender: .male, type: .herbivore),
            Dinosaur(name: "Pachycephalosaurus", gender: .female, type: .herbivore),
            Dinosaur(name: "Microraptor", gender: .male, type: .carnivore),
            Dinosaur(name: "Therizinosaurus", gender: .female, type: .herbivore),
            Dinosaur(name: "Deinonychus", gender: .male, type: .carnivore),
            Dinosaur(name: "Utahraptor", gender: .female, type: .carnivore),
            Dinosaur(name: "Saurolophus", gender: .male, type: .herbivore),
            Dinosaur(name: "Albertosaurus", gender: .female, type: .carnivore),
            Dinosaur(name: "Ornithomimus", gender: .male, type: .herbivore),
            Dinosaur(name: "Mamenchisaurus", gender: .female, type: .herbivore),
            Dinosaur(name: "Plateosaurus", gender: .male, type: .herbivore)
        ]

        
        // Initialize resources, you can customize this
        self.resources = [
            Resource(name: "Berries", level: 1, harvestAmount: 5, harvestTime: 10),
            Resource(name: "Wood", level: 1, harvestAmount: 3, harvestTime: 8),
            Resource(name: "Stone", level: 1, harvestAmount: 2, harvestTime: 12),
            Resource(name: "Metal", level: 1, harvestAmount: 1, harvestTime: 30),
            Resource(name: "Clay", level: 2, harvestAmount: 4, harvestTime: 15),
            Resource(name: "Gold", level: 3, harvestAmount: 1, harvestTime: 25),
            Resource(name: "Gems", level: 4, harvestAmount: 2, harvestTime: 35),
            Resource(name: "Crystal", level: 2, harvestAmount: 3, harvestTime: 20),
            Resource(name: "Leather", level: 1, harvestAmount: 2, harvestTime: 18),
            Resource(name: "Fibers", level: 1, harvestAmount: 6, harvestTime: 12),
            Resource(name: "Charcoal", level: 2, harvestAmount: 3, harvestTime: 16),
            Resource(name: "Salt", level: 3, harvestAmount: 4, harvestTime: 22),
            Resource(name: "Sulfur", level: 3, harvestAmount: 2, harvestTime: 28),
            Resource(name: "Bones", level: 1, harvestAmount: 5, harvestTime: 14),
            Resource(name: "Oil", level: 4, harvestAmount: 1, harvestTime: 40)
        ]

    }
}
