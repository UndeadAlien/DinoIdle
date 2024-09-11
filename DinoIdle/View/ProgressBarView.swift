//
//  ProgressBarView.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 9/5/24.
//

import SwiftUI

struct ProgressBarView: View {
    @ObservedObject var dinosaur: Dinosaur

    var body: some View {
        ProgressView("", value: dinosaur.progress, total: 1.0)
            .progressViewStyle(LinearProgressViewStyle())
    }
}

#Preview {
    let sampleDino = Dinosaur(name: "Tyrannosaurus rex", gender: .male, type: .carnivore)
    sampleDino.addItem(name: "Berries", quantity: 10)
    sampleDino.addItem(name: "Wood", quantity: 5)
    return ProgressBarView(dinosaur: sampleDino)
        .preferredColorScheme(.dark)
}


