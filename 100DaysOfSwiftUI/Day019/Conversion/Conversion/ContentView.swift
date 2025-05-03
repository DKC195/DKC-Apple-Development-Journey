//
//  ContentView.swift
//  Conversion
//
//  Created by Dhiraj KC on 2025-05-02.
//

import SwiftUI

struct ContentView: View {
    @State private var sourceValue: Double = 0
    @State private var outputValue: Double = 0
    @State private var selectedValueType: String = "Meters"
    @State private var outputType: String = "Feet"
    @FocusState private var amountIsActive: Bool
    
    let unitMap: [String: UnitLength] = [
        "Meters": .meters,
        "Kilometers": .kilometers,
        "Feet": .feet,
        "Yards": .yards,
        "Miles": .miles
    ]
    
    var convertedValue: Measurement<UnitLength> {
        let inputUnit = unitMap[selectedValueType] ?? .meters
        let outputUnit = unitMap[outputType] ?? .feet
        let inputMeasurement = Measurement(value: sourceValue, unit: inputUnit)
        return inputMeasurement.converted(to: outputUnit)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Source Value") {
                    TextField("Enter value", value: $sourceValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsActive)
                }
                
                Section("Input Type") {
                    Picker("Value Type", selection: $selectedValueType) {
                        ForEach(unitMap.keys.sorted(), id: \.self) { key in
                            Text(key)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section("Output Type") {
                    Picker("Output Type", selection: $outputType) {
                        ForEach(unitMap.keys.sorted(), id: \.self) { key in
                            Text(key)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section("Output Value") {
                    Text("\(convertedValue.value, specifier: "%.2f") \(convertedValue.unit.symbol)")
                }
            }
            .navigationTitle("Conversion Tool")
            .toolbar {
                if amountIsActive {
                    Button("Done") {
                        amountIsActive = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

