//
//  EditGoalsBubblesView.swift
//  Fruitfull
//
//  Created by Akansha on 25/2/2025.
//

import SwiftUI

struct EditGoalsBubblesView: View {
    @State private var infoAlert = false
    
    var title: String
    @Binding var value: Double
    var colour: Color
    var symbol: String
    
    @State var alertTitle = ""
    @State var alertMessage = ""
    @State var alertButtonText = ""
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: symbol)
                Text(title)
                    .font(.title2)
                Spacer()
                Button {
                    infoAlert = true
                } label: {
                    Image(systemName:"info.circle")
                }
                .alert(Text(alertTitle), isPresented: $infoAlert) {
                    Button(alertButtonText) {
                        
                    }
                } message: {
                    Text(alertMessage)
                    
                }
            }
            Slider(value: $value, in: 0...24, step: 0.5)
            HStack{
                Text("Hours per day: \(String(format: "%.1f", Double(value)))")
                Spacer()
                Text("Hours per week: \(String(format: "%.1f", Double(value)))")
            }
            
        }
        .padding(20)
        .background(colour.opacity(0.25))
        .cornerRadius(30)
    }
}

#Preview {
    EditGoalsBubblesView( title: "Sleep", value: .constant(0), colour: .blue, symbol: "briefcase.fill" , alertTitle: "sleep", alertMessage: "what are you doing", alertButtonText: "done")
}

