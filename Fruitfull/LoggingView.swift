//
//  ContentView.swift
//  Fruitfull
//
//  Created by Yana Duran on 24/2/2025.
//

import SwiftUI

struct LoggingView: View {
    @State private var sleep = 0.0
    @State private var movement = 0.0
    @State private var social = 0.0
    @State private var personal = 0.0
    @State private var downtime = 0.0
    @State private var study = 0.0
    @State private var work = 0.0
    
    
    
    
    @State private var showingAlertsleep: Bool = false
    @State private var alertTitlesleep: String = "Sleep Information"
    @State private var alertMessagesleep: String = "It is recommended to get 7-9 hours of sleep each night. add link"
    @State private var alertButtonTextsleep: String = "Done"
    
    @State private var showingAlertmovement: Bool = false
    @State private var alertTitlesmovement: String = "Movement Information"
    @State private var alertMessagemovement: String = "It is recommended to get movement. add link"
    @State private var alertButtonTextmovement: String = "Done"
    
    @State private var showingAlertsocial: Bool = false
    @State private var alertTitlesocial: String = "Social Information"
    @State private var alertMessagesocial: String = "This includes time spent with family and friends"
    @State private var alertButtonTextsocial: String = "Done"
    
    @State private var showingAlertpersonal: Bool = false
    @State private var alertTitlepersonal: String = "Personal Information"
    @State private var alertMessagepersonal: String = "This includes...."
    @State private var alertButtonTextpersonal: String = "Done"
    
    @State private var showingAlertdowntime: Bool = false
    @State private var alertTitledowntime: String = "Downtime Information"
    @State private var alertMessagedowntime: String = "This includes things like"
    @State private var alertButtonTextdowntime: String = "Done"
    
    
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
                        EditGoalsBubbleSubView(title: "Sleep", value: $sleep, colour: .green, alertTitle: "sleep", alertMessage: "what are you doing", alertButtonText: "done" )
                        EditGoalsBubbleSubView(title: "Movement", value: $movement, colour: .blue, alertTitle: "Movement Information", alertMessage: "add info", alertButtonText: "done" )
                        EditGoalsBubbleSubView(title: "Social", value: $social, colour: .yellow, alertTitle: "Social Information", alertMessage: "add info", alertButtonText: "done" )
                        EditGoalsBubbleSubView(title: "Personal", value: $personal, colour: .orange, alertTitle: "Personal Information", alertMessage: "add info", alertButtonText: "done" )
                        EditGoalsBubbleSubView(title: "Downtime", value: $downtime, colour: .pink, alertTitle: "Downtime Information", alertMessage: "add examples", alertButtonText: "done" )
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
                //.navigationBarTitle("Today", displayMode: .large)
                //.navigationBarTitleDisplayMode(.centered)
                
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
    LoggingView()
}
