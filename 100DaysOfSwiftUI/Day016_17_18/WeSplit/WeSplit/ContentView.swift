//
//  ContentView.swift
//  WeSplit
//
//  Created by Dhiraj KC on 2025-04-27.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var noOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFoucsed: Bool
    
//    let tipPercentages = [0, 10, 15, 20, 25]
    
    var total: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount * (tipSelection / 100)
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(noOfPeople + 2)
        let amountPerPerson = total / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFoucsed)
                    
                    Picker("Number of People", selection: $noOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Tip Percentage") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.navigationLink)
                
                }
                
                Section("Total Amount") {
                    Text(total, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Amount per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFoucsed {
                    Button("Done") {
                        amountIsFoucsed = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
