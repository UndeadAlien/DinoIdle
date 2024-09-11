//
//  DropTable.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 8/12/24.
//

import Foundation

struct DropTable: Identifiable {
    var id = UUID()
    var items: [DropItem]
    
    struct DropItem: Identifiable {
        var id = UUID()
        var item: Item
        var dropChance: Double  // Expect values between 0.0 and 1.0
    }

    func rollForSingleDrop() -> Item? {
        let randomValue = Double.random(in: 0...1)
        print("Random Value: \(randomValue)")
        
        var cumulativeChance: Double = 0.0

        for dropItem in items {
            cumulativeChance += dropItem.dropChance
            print("Checking item: \(dropItem.item.name), Cumulative Chance: \(cumulativeChance)")
            if randomValue <= cumulativeChance {
                print("Item selected: \(dropItem.item.name)")
                return dropItem.item
            }
        }

        return nil
    }


}


