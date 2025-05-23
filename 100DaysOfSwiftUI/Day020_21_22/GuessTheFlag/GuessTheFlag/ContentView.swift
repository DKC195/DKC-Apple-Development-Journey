//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Dhiraj KC on 2025-05-03.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var rotationAmount = [0.0, 0.0, 0.0]
    @State private var opacity: [Double] = [1 , 1 , 1]
    @State private var flagScale: [CGFloat] = [1.0, 1.0, 1.0]
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreCount = 0
    @State private var noOfCards = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                        //                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                                withAnimation(.easeInOut(duration: 0.6)) {
                                    rotationAmount[number] += 360
                                    opacity = [0.25, 0.25, 0.25]
                                    opacity[number] = 1
                                    flagScale = [0.50, 0.50, 0.50]
                                    flagScale[number] = 1.2
                                }
                                flagTapped(number)
                            } label: {
                                FlagImage(country: countries[number])
                                    .opacity(opacity[number])
                                    .rotation3DEffect(
                                        .degrees(rotationAmount[number]),
                                        axis: (x: 0, y: 1, z: 0)
                                    )
                                    .scaleEffect(flagScale[number])
                            }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(scoreCount)/8")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("Count: \(noOfCards)")
                    .foregroundStyle(.white)
                    .font(.headline.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if noOfCards >= 8 {
                Button("Restart", action: resetApp)
            } else {
                Button("Continue", action: askQuestion)
            }
        } message: {
            if noOfCards <= 8 {
                Text("Your score is \(scoreCount).")
            } else {
                Text("You have finished the game. Your score is \(scoreCount).")
            }
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            scoreCount += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        
        showingScore = true
        noOfCards += 1
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        rotationAmount = [0.0, 0.0, 0.0]
        opacity = [1, 1, 1]
        flagScale = [1, 1, 1]
    }
    
    func resetApp() {
        scoreCount = 0
        noOfCards = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
