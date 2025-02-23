//
//  FruitfullApp.swift
//  Fruitfull
//
//  Created by Yana Duran on 24/2/2025.
//

import SwiftUI

@main
struct FruitfullApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "tree")
                        Text("Home")
                    }
                
                HomeView()  // change this to logging view
                    .tabItem {
                        Image(systemName: "drop")
                        Text("Logging")
                    }
                
                HomeView() // change this to account view
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
            }
        }
    }
}
