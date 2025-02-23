//
//  ContentView.swift
//  Fruitfull
//
//  Created by Yana Duran on 24/2/2025.
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let color: Color
    let score: Int
}

struct HomeView: View {
    
    let categories = [
        Category(name: "Sleep", icon: "leaf.fill", color: .green, score: 4),
        Category(name: "Movement", icon: "drop.fill", color: .blue, score: 3),
        Category(name: "Social", icon: "drop.fill", color: .yellow, score: 3),
        Category(name: "Personal", icon: "drop.fill", color: .red, score: 3),
        Category(name: "Downtime", icon: "drop.fill", color: .pink, score: 3),
        Category(name: "Study", icon: "drop.fill", color: .purple, score: 3),
        Category(name: "Work", icon: "drop.fill", color: .brown, score: 3)
    ]
    
    var body: some View {
        VStack {
            Text("Fruitful")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Well done, your week has been fruitful!")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            ScrollView {
                Image(.image)
                    .padding()
                
                VStack {
                    ForEach(categories) { category in
                        HStack {
                            VStack {
                                HStack{
                                    Text(category.name)
                                        .font(.headline)
                                        .frame(width: 200, alignment: .leading)
                                    
                                    HStack {
                                        ForEach(0..<5, id: \.self) { index in
                                            Image(systemName: index < category.score ? "drop.fill" : "drop")
                                                .foregroundColor(category.color)
                                        }
                                }
    
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .padding(.bottom, 20)
                            
                            NavigationLink(destination: Text("Details for \(category.name)")) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 20)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Screen")
    }
}

#Preview {
    HomeView()
}


