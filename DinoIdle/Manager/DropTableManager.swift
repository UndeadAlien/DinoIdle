//
//  DropTableManager.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 9/11/24.
//

import Foundation

class DropTableManager {
    static let shared = DropTableManager()

    // Predefined DropTables
    let bushDropTable: DropTable
    let treeDropTable: DropTable
    let stoneDropTable: DropTable

    private init() {
        // Initialize bush drop table
        bushDropTable = DropTable(items: [
            DropTable.DropItem(item: Item.resourceItems[0], dropChance: 0.75),
            DropTable.DropItem(item: Item.resourceItems[1], dropChance: 0.25)
        ])
        
        // Initialize tree drop table
        treeDropTable = DropTable(items: [
            DropTable.DropItem(item: Item.resourceItems[2], dropChance: 0.75),
            DropTable.DropItem(item: Item.resourceItems[3], dropChance: 0.25)
        ])
        
        // Initialize stone drop table
        stoneDropTable = DropTable(items: [
            DropTable.DropItem(item: Item.resourceItems[4], dropChance: 0.75),
            DropTable.DropItem(item: Item.resourceItems[5], dropChance: 0.25)
        ])
    }
}
