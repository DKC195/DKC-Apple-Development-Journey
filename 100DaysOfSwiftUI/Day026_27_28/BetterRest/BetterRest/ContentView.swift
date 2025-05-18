//
//  ContentView.swift
//  BetterRest
//
//  Created by Dhiraj KC on 2025-05-17.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header:Text("When do you want to wake up?")) {
                    DatePicker("Please enter time:", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .onAppear(perform: calculateBedtime)
                        .onChange(of: wakeUp, calculateBedtime)
                }
                
                Section(header: Text("Desired amount of sleep")) {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section(header: Text("Daily coffee intake")) {
                    Picker("Coffee Amount", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) {
                            Text("^[\($0) cup](inflect: true)")
                        }
                    }
                }
                
                Section(header: Text("Recommended Bed Time")) {
                    HStack{
                        Text("\(alertTitle)")
                        Spacer()
                        Text("\(alertMessage)")
                    }
                }
            }
            .navigationTitle(Text("BetterRest"))
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour+minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, There was a problem calculating your bedtime."
        }
        
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
