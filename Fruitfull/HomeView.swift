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
    let goalTime: Double
    let loggedTime: Double
}

struct HomeView: View {
    
    @State private var showAlert = false
    
    let categories = [
        Category(name: "Sleep", icon: "leaf.fill", color: .green, score: 4, goalTime: 24, loggedTime: 19.2),
        Category(name: "Movement", icon: "drop.fill", color: .blue, score: 3, goalTime: 24, loggedTime: 19.2),
        Category(name: "Social", icon: "drop.fill", color: .yellow, score: 3, goalTime: 24, loggedTime: 19.2),
        Category(name: "Personal", icon: "drop.fill", color: .red, score: 3, goalTime: 24, loggedTime: 19.2),
        Category(name: "Downtime", icon: "drop.fill", color: .pink, score: 3, goalTime: 24, loggedTime: 19.2),
        Category(name: "Study", icon: "drop.fill", color: .purple, score: 3, goalTime: 24, loggedTime: 19.2),
        Category(name: "Work", icon: "drop.fill", color: .brown, score: 3, goalTime: 24, loggedTime: 19.2)
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
                    Text("Your Week's View")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    ForEach(categories) { category in
                        HStack {
                            VStack {
                                HStack(spacing: 4) {
                                    Text("\(category.name): \(category.goalTime.formatted(.number.precision(.fractionLength(1)))) hrs")                                        .font(.callout)
                                        .frame(width: 240, alignment: .leading)
                                    
                                    HStack(spacing: 1) {
                                        ForEach(0..<5, id: \.self) { index in
                                            Image(systemName: "drop.fill")
                                                .symbolVariant(index < category.score ? .fill : .none)
                                                .foregroundColor(category.color)
                                                .font(.system(size: 16))
                                        }
                                    }
                                }
                                .padding(2)
                                
                                Text("Time logged: \(category.loggedTime.formatted(.number.precision(.fractionLength(1)))) hrs")
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                    .foregroundStyle(.gray.opacity(0.6))
                                
                                
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .padding(.bottom, 20)
                            
                            

                            Button {
                                showAlert = true
                            } label: {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 20)
                            }
                            .alert("Details", isPresented: $showAlert) {
                                Button("OK") { }
                            } message: {
                                Text("Details for \(category.name)")
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


