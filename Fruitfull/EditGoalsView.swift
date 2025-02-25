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
            Text("Edit Goals")
                .font(.system(size:34, weight:.bold))
            
            NavigationStack {
                ScrollView {
                    VStack {
                        Text("What time balance will make your tree fruitful?")
                            .font(.title)
                        
                            .multilineTextAlignment(.center)
                        EditGoalsBubblesView(symbol: "bed.double.fill", title: " Sleep", value: $sleep, colour: .green, alertTitle: "Sleep", alertMessage: "Sleep is cruicial for enhacing overall well-being and cognitive function with most people needing 7-9 hours.", alertButtonText: "Done" )
                        EditGoalsBubblesView(symbol: "figure.walk", title: "Movement", value: $movement, colour: .blue, alertTitle: "Movement Information", alertMessage: "Physical movement is important for overall health and well-being and recommended 30mins a day.", alertButtonText: "Done" )
                        EditGoalsBubblesView(symbol: "person.2", title: "Social", value: $social, colour: .yellow, alertTitle: "Social Information", alertMessage: "Regular social connection is important to combat loneliness and foster emtional wellbeing. This can incude seeing friends and family.", alertButtonText: "Done" )
                        EditGoalsBubblesView(symbol: "leaf", title: "Personal", value: $personal, colour: .orange, alertTitle: "Personal Information", alertMessage: "This includes time dedicated  to hobbies, running errands, attending appointments or engaging in activities that contribute to your personal wellbeing.", alertButtonText: "Done" )
                        EditGoalsBubblesView(symbol: "clock", title: "Downtime", value: $downtime, colour: .pink, alertTitle: "Downtime Information", alertMessage: "This is time spent doing nothing in particular, like scrolling on your phone or simply lying in bed. Rest is essential, so don’t feel guilty as your mind and body need it.", alertButtonText: "Done" )
                        VStack{
                            HStack{
                                Image(systemName: "book")
                                Text("Study")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                                
                            }
                            Slider(value: $study, in: 0...24, step:0.5)
                            HStack{
                                Text("Hours per day: \(String(format: "%.1f", Double(study)))")
                                Spacer()
                                Text("Hours per week: \(String(format: "%.1f", Double(study)*7))")
                            }
                        }
                        .padding(20)
                        .background(Color.purple.opacity(0.25))
                        .cornerRadius(30)
                        
                        
                        VStack{
                            HStack{
                                Image(systemName: "briefcase")
                                Text("Work")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            Slider(value: $work, in: 0...24, step:0.5)
                            HStack{
                                Text("Hours per day: \(String(format: "%.1f", Double(work)))")
                                Spacer()
                                Text("Hours per week: \(String(format: "%.1f", Double(work)*7))")
                            }
                        }
                        .padding(20)
                        .background(Color.black.opacity(0.25))
                        .cornerRadius(30)
                    }
                    Text ("Total Time Commitment: \(String(format: "%.1f", Double(sleep+movement+social+personal+downtime+study+work)))")
                        .font(.title2)
                }
                .onChange(of: sleep, checkHoursNotExceeded)
                .onChange(of: movement, checkHoursNotExceeded)
                .onChange(of: social, checkHoursNotExceeded)
                .onChange(of: personal, checkHoursNotExceeded)
                .onChange(of: downtime, checkHoursNotExceeded)
                .onChange(of: study, checkHoursNotExceeded)
                .onChange(of: work, checkHoursNotExceeded)
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
