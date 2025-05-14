//
//  ContentView.swift
//  RockPaperSissor
//
//  Created by Dhiraj KC on 2025-05-09.
//

import SwiftUI

struct roundedGreen: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.green.opacity(0.5))
            .cornerRadius(25)
    }
}

struct ContentView: View {
    @State private var botAction: Int = 0
    @State private var showAction: Bool = false
    @State private var resultsWLT: [Int] = [0,0,0]
    @State private var showScore: Bool = false
    @State private var alertMessage: String = ""
    
    var actions: [String] = ["✊", "✋", "✌️"]
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Opponent")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(1)
                    
                    Text("\(actions[botAction])")
                        .blur(radius: showAction ? 0 : 30)
                }
                .modifier(roundedGreen())
                .padding(10)
                
                VStack {
                    Text("User")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(1)
                    
                    HStack {
                        ForEach(0..<3) {number in
                            Button {
                                Play(number)
                            } label: {
                                Text(actions[number])
                            }
                        }
                    }
                }
                .modifier(roundedGreen())
                
                VStack {
                    Text("Score: \(resultsWLT[0]) Win \(resultsWLT[1]) Lose \(resultsWLT[2]) Tie")
                }
                .font(.headline)
                .modifier(roundedGreen())
                .padding()
            }
            .padding()
            .alert(alertMessage, isPresented: $showScore){
                if resultsWLT.reduce(0, +) < 10{
                    Button("Restart", role: .destructive, action: restartGame)
                    Button("Next Round", role: .cancel,action: nextRound)
                } else {
                    Button("Restart", action: restartGame)
                }
            } message: {
                Text("Round \(resultsWLT.reduce(0, +))/\(10)")
            }
            
        }
        .font(.system(size: 80))
        .foregroundStyle(Color.white)
    }
    
    func restartGame() {
        resultsWLT = [0, 0, 0]
        showAction = false
    }
    
    func nextRound() {
        showScore = false
        showAction = false
        botAction = Int.random(in: 0..<3)
    }
    
    func Play(_ number: Int) {
        alertMessage = "You Win This Round"
        if botAction == number {
            resultsWLT[2] = resultsWLT[2] + 1
            alertMessage = "You Tie This Round"
        } else if botAction == 2 && number == 0 {
            resultsWLT[0] = resultsWLT[0] + 1
        } else if botAction == 0 && number == 1 {
            resultsWLT[0] = resultsWLT[0] + 1
        } else if botAction == 1 && number == 2 {
            resultsWLT[0] = resultsWLT[0] + 1
            
        } else {
            resultsWLT[1] = resultsWLT[1] + 1
            alertMessage = "You Lose This Round"
        }
        
        showScore = true
        showAction = true
    }
}

#Preview {
    ContentView()
}
