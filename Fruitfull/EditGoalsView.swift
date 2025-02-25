//
//  ContentView.swift
//  Fruitfull
//
//  Created by Yana Duran on 24/2/2025.
//

import SwiftUI

struct EditGoalsView: View {
    @State private var sleep = 0.0
    @State private var movement = 0.0
    @State private var social = 0.0
    @State private var personal = 0.0
    @State private var downtime = 0.0
    @State private var study = 0.0
    @State private var work = 0.0
    
    
    @State private var showingAlerttoomuch: Bool = false
    @State private var alertTitletoomuch: String = "Error"
    @State private var alertMessagetoomuch: String = "You've exceeded the total time amount per day"
    @State private var alertButtonTexttoomuch: String = "Done"
    @State private var total = 0.0
    
    var body: some View {
        VStack(spacing: 8)
        {
            Text("Today")
                .font(.system(size:34, weight:.bold))
            
            NavigationStack {
                ScrollView {
                    VStack {
                        Text("How did you water your tree today?")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        EditGoalsBubblesView(title: "Sleep", value: $sleep, colour: .green,  symbol: "briefcase.fill" , alertTitle: "sleep", alertMessage: "what are you doing", alertButtonText: "done" )
                        EditGoalsBubblesView(title: "Movement", value: $movement, colour: .blue,  symbol: "briefcase.fill" , alertTitle: "Movement Information", alertMessage: "add info", alertButtonText: "done" )
                        EditGoalsBubblesView(title: "Social", value: $social, colour: .yellow, alertTitle: "Social Information", alertMessage: "add info", alertButtonText: "done" )
                        EditGoalsBubblesView(title: "Personal", value: $personal, colour: .orange,  symbol: "briefcase.fill" , alertTitle: "Personal Information", alertMessage: "add info", alertButtonText: "done" )
                        EditGoalsBubblesView(title: "Downtime", value: $downtime, colour: .pink,  symbol: "briefcase.fill" , alertTitle: "Downtime Information", alertMessage: "add examples", alertButtonText: "done" )
                        VStack{
                            HStack{
                                Text("Study")
                                    .font(.title2)
                                Spacer()
                                
                            }
                            Slider(value: $study, in: 0...24, step:0.5)
                            HStack{
                                Text("Hours per day: \(String(format: "%.1f", Double(study)))")
                            }
                        }
                        .padding(20)
                        .background(Color.purple.opacity(0.25))
                        .cornerRadius(30)
                        
                        
                        VStack{
                            HStack{
                                Image(systemName: "briefcase.fill")
                                Text("Work")
                                    .font(.title2)
                                Spacer()
                            }
                            Slider(value: $work, in: 0...24, step:0.5)
                            HStack{
                                Text("Hours per day: \(String(format: "%.1f", Double(work)))")
                            }
                        }
                        .padding(20)
                        .background(Color.black.opacity(0.25))
                        .cornerRadius(30)
                    }
                }
                .onChange(of: sleep + study + movement + social + work + personal + downtime, checkHoursNotExceeded)
                .alert(Text(alertTitletoomuch), isPresented: $showingAlerttoomuch) {
                    Button(alertButtonTexttoomuch) {
                        
                    }
                } message: {
                    Text(alertMessagetoomuch)
                    
                }
            }
            .padding(15)
        }
    }
    
    func checkHoursNotExceeded() {
        if sleep + study + movement + social + work + personal + downtime > 24 {
            showingAlerttoomuch = true
        }
    }
}

#Preview {
    EditGoalsView()
}
