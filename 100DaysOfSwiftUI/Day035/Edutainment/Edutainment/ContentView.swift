//
//  ContentView.swift
//  Edutainment
//
//  Created by Dhiraj KC on 2025-05-23.
//

import SwiftUI

struct ContentView: View {
    @State private var tableHead = 5
    @State private var noOfQuestion: Int = 5
    @State private var difficultyLevel = 0
    
    @State private var difficultyText = ["Easy", "Medium", "Hard"]
    @State private var difficultyFactor = [1, 3, 7]
    @State private var answers: [Int] = Array(repeating: 0, count: 15)
    @State private var inputs: [Int] = Array(repeating: 0, count: 15)
    
    @State private var randomizer = Int.random(in: 1...5)
    
    @State private var alertTitle: String?
    @State private var alertMessage: String?
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("Game Setting") {
                    Stepper("Practice Multiplication of \(tableHead)", value: $tableHead, in: 1...15)
                    Stepper("No of Questions: \(noOfQuestion)", value: $noOfQuestion, in: 5...15, step: 5)
                    Picker("Difficulty Level", selection: $difficultyLevel) {
                        ForEach(difficultyText.indices, id: \.self) { index in
                            Text(difficultyText[index]).tag(index)
                        }
                    }
                }
                
                Section("Answer the following questions") {
                    ForEach(0..<noOfQuestion, id: \.self) { index in
                        HStack {
                            let multiplier = (index + 1) * randomizer + difficultyFactor[difficultyLevel]
                            Text("Q\(index + 1): \(tableHead) x \(multiplier) =")
                            
                            TextField("Enter number", value: $inputs[index], formatter: NumberFormatter.integer)
                                .keyboardType(.numberPad)
                                .frame(width: 80)
                        }
                    }
                }
                
                Button("Submit") {
                    submit()
                }
            }
            .navigationTitle("Edutainment")
            .alert(alertTitle ?? "Result", isPresented: $showAlert) {
                Button("OK") {
                    newGame()
                }
            } message: {
                Text(alertMessage ?? "Unknown error")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func submit() {
//        print(randomizer)
        answers = Array(0..<noOfQuestion).map { (index) -> Int in
            let multiplier = (index + 1) * randomizer + difficultyFactor[difficultyLevel]
//            print("\(multiplier) \(tableHead * multiplier)")
            return tableHead * multiplier
        }
//        print(difficultyFactor[difficultyLevel])
        
//        print(answers)
//        print(inputs)
        
        let matches = zip(answers, inputs).filter { $0 == $1 }.count
        
        alertTitle = "Result"
        alertMessage = "You got \(matches)/\(noOfQuestion) correct"
        showAlert = true
    }
    
    func newGame() {
        answers = Array(repeating: 0, count: 15)
        inputs = Array(repeating: 0, count: 15)
        randomizer = Int.random(in: 1...5)
    }
}

extension NumberFormatter {
    static var integer: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }
}

#Preview {
    ContentView()
}
