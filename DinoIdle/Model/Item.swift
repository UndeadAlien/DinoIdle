//
//  Item.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 8/8/24.
//

import Foundation

class Item: Identifiable {
    var id = UUID()
    var name: String
    var weight: Double
    var quantity: Int
    var isStackable: Bool
    
    init(name: String, weight: Double, quantity: Int, isStackable: Bool) {
        self.name = name
        self.weight = weight
        self.quantity = quantity
        self.isStackable = isStackable
    }
    
    static let resourceItems = [
        // Bush - Berries - 1st / Fiber - 2nd
        Item(name: "Berries", weight: 0.1, quantity: 5, isStackable: true),
        Item(name: "Fiber", weight: 0.1, quantity: 15, isStackable: true),
        // Tree - Wood - 1st / Thatch - 2nd
        Item(name: "Wood", weight: 0.5, quantity: 1, isStackable: true),
        Item(name: "Thatch", weight: 0.2, quantity: 5, isStackable: true),
        // Stone - 1st / Flint - 2nd
        Item(name: "Stone", weight: 1.0, quantity: 1, isStackable: true),
        Item(name: "Flint", weight: 0.25, quantity: 1, isStackable: true),
        // Metal - 1st / Stone - 2nd
        Item(name: "Metal", weight: 2.0, quantity: 1, isStackable: true),
        
        Item(name: "Clay", weight: 1.2, quantity: 4, isStackable: true),
        Item(name: "Gold", weight: 0.8, quantity: 1, isStackable: true),
        Item(name: "Gems", weight: 0.4, quantity: 2, isStackable: true),
        Item(name: "Crystal", weight: 1.5, quantity: 3, isStackable: true),
        Item(name: "Leather", weight: 0.3, quantity: 2, isStackable: true),
        Item(name: "Fibers", weight: 0.2, quantity: 6, isStackable: true),
        Item(name: "Charcoal", weight: 0.6, quantity: 3, isStackable: true),
        Item(name: "Salt", weight: 0.5, quantity: 4, isStackable: true),
        Item(name: "Sulfur", weight: 1.0, quantity: 2, isStackable: true),
        Item(name: "Bones", weight: 0.7, quantity: 5, isStackable: true),
        Item(name: "Oil", weight: 3.0, quantity: 1, isStackable: true)
    ]

}

