//
//  TabBarView.swift
//  DinoIdle
//
//  Created by Connor Hutchinson on 8/12/24.
//

import SwiftUI

enum Tabs: CaseIterable {
    case home
    case dinosaurs
    case harvesting
}

struct TabBarView: View {
    
    @State private var selectedTab: Tabs = .home
    
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var gameState = GameState()
    
    var body: some View {
        NavigationStack {
            ZStack {
                switch selectedTab {
                case .home:
                    NavigationStack {
                        MainGameView(gameState: gameState)
                    }
                case .dinosaurs:
                    NavigationStack {
                        DinosaurView(gameState: gameState)
                    }
                case .harvesting:
                    NavigationStack {
                        ResourceView(gameState: gameState)
                    }
                }
            }
            
            tabBarItems
        }
        
    }
    
    var tabBarItems: some View {
        HStack {
            Button {
                selectedTab = .home
            } label: {
                CustomTabBarItem(buttonIcon: "house", buttonText: "Home", isActive: selectedTab == .home)
            }
            .tint(colorScheme == .dark ? .white : .black)
            .shadow(color: .black, radius: 4, x: 4, y: 4)
            
            Button {
                selectedTab = .dinosaurs
            } label: {
                CustomTabBarItem(buttonIcon: "ant.fill", buttonText: "Dinos", isActive: selectedTab == .dinosaurs)
            }
            .tint(colorScheme == .dark ? .white : .black)
            .shadow(color: .black, radius: 4, x: 4, y: 4)
            
            Button {
                selectedTab = .harvesting
            } label: {
                CustomTabBarItem(buttonIcon: "leaf.fill", buttonText: "Harvesting", isActive: selectedTab == .harvesting)
            }
            .tint(colorScheme == .dark ? .white : .black)
            .shadow(color: .black, radius: 4, x: 4, y: 4)
        }
        .frame(height: 72)
    }
}

#Preview {
    TabBarView()
        .preferredColorScheme(.dark)
}
