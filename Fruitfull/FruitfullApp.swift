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
            .tint(.greenColour)
        }
    }
}


//greenColour - 6AA458
//lightgreenColour - CEE2C9
//blueColour - 0096FF
//lightblueColour - D0E4FD
//yellowColour - F8D686
//lightyellowColour - FEF5E0
//orangeColour - F09937
//lightorangeColour- FCE5CD
//pinkColour -
//lightpinkColour - FCE3F5
