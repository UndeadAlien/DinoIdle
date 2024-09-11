//
//  Dinosaur.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 8/8/24.
//

import Foundation
import Combine

class Dinosaur: ObservableObject, Identifiable {
    var id = UUID()
    var name: String
    var gender: DinoGender
    var type: DinoType
    @Published var inventory: [String: Int] = [:]
    @Published var state: DinoState = .idle
    @Published var progress: Double = 0.0
    @Published var attachedResource: Resource?

    private var timer: AnyCancellable?

    enum DinoGender { case male, female, neutral }
    enum DinoType { case carnivore, herbivore }
    enum DinoState { case idle, farming, fighting }

    init(name: String, gender: DinoGender, type: DinoType) {
        self.name = name
        self.gender = gender
        self.type = type
    }

    func addItem(name: String, quantity: Int) {
        if let currentQuantity = inventory[name] {
            inventory[name] = currentQuantity + quantity
        } else {
            inventory[name] = quantity
        }
    }

    func removeItemFromInventory(name: String) {
        inventory.removeValue(forKey: name)
    }

    func startHarvesting(on resource: Resource) {
        attachedResource = resource
        state = .farming
        timer?.cancel()

        timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.progress += 0.1 / resource.harvestTime

                if self.progress >= 1.0 {
                    self.progress = 0.0
                    self.harvest(resource: resource)
                }
            }
    }

    private func harvest(resource: Resource) {
        let harvestedQuantity = resource.harvestAmount
        addItem(name: resource.name, quantity: harvestedQuantity)
    }

    func stopHarvesting() {
        timer?.cancel()
        state = .idle
        progress = 0.0
    }

    deinit {
        timer?.cancel()
    }
}
