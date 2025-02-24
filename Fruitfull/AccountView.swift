//
//  ContentView.swift
//  Fruitfull
//
//  Created by Yana Duran on 24/2/2025.
//

import SwiftUI

struct AccountView: View {
        var body: some View {
            
            ZStack {
                //Account View
                VStack(spacing: 10) {
                    Text("Account View")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 50)
                        .padding(.bottom, 120)
                    
                    VStack(spacing: 30) {
                        MenuButton(
                            title: "Edit Goals",
                            icon: "target",
                            action: {}
                        )
                        
                        MenuButton(
                            title: "iCloud Sync",
                            icon: "arrow.2.circlepath",
                            action: {}
                        )
                        
                        MenuButton(
                            title: "Settings",
                            icon: "gearshape",
                            action: {}
                        )
                    }
                    .padding(.horizontal, 70)
                    
                    Spacer()
                    

                // Custom tab bar
                    CustomTabBar()
                        .padding(.top, 70)
                }
                .background(.white)
                
            // Bamboo background (N.A ~ leaf.fill)
                Image(.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 500, height: 800, alignment: .trailing)
                    .offset(x: 350, y: -10)
                
                
            }
        }
            
    //Edits
        //01
            struct MenuButton: View {
                let title: String
                let icon: String
                let action: () -> Void
                
                var body: some View {
                    Button(action: action) {
                        HStack {
                            Image(systemName: icon)
                                .font(.system(size: 40))
                                .foregroundColor(.black)
                                .frame(width: 70, height: 70)
                                .padding(.horizontal, 10)
                            
                            Text(title)
                                .foregroundColor(.black)
                                .font(.system(size: 25))
                            
                            Spacer()
                        }
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                    }
                }
            }
            
            
        //02
        struct CustomTabBar: View {
                var body: some View {
                    HStack {
                        Spacer()
                        TabBarButton(icon: "tree", isSelected: false)
                        Spacer()
                        TabBarButton(icon: "drop", isSelected: false)
                        Spacer()
                        TabBarButton(icon: "person.crop.circle", isSelected: true, isPersonIcon: true)
                        Spacer()
                    }
                    .padding(.bottom, 05)
                    .padding(.horizontal, -40)
                    .background(Color.white)
                    //.background(Color(UIColor.secondarySystemBackground))
                }
            }
        }
        
        //03
        struct TabBarButton: View {
            let icon: String
            let isSelected: Bool
            var isPersonIcon: Bool = false
            
            var iconColor: Color {
                if isPersonIcon && isSelected {
                    return .brown
                }
                return isSelected ? .primary : .gray
            }
            
            var body: some View {
                Image(systemName: icon)
                    .foregroundColor(iconColor)
                    .font(.system(size: 24))
            }
        }

    // Preview
            struct AccountView_Previews: PreviewProvider {
                static var previews: some View {
                    AccountView()
                }
            }
