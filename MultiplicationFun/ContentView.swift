//
//  ContentView.swift
//  MultiplicationFun
//
//  Created by Woodrow Martyr on 17/1/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var highestMultiplicationTable = 0
    @State private var questionNumber = 5
    @State private var multiplicand = 2
    @State private var multiplier = 12
    @State private var correctAnswerIndex = 0
    @State private var score = 0
    @State private var answerArray = [0, 0, 0]
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var endOfGame = false
    
    let questionNumbers = [5, 10, 20]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    Text("Enter the tables to practice")
                    Picker("Enter the tables to practice", selection: $highestMultiplicationTable) {
                        ForEach(2..<13) {
                            Text("Up to \($0)")
                        }
                    }
                    .onChange(of: highestMultiplicationTable){
                        newQuestion()
                    }
                }
                Text("How many questions do you want")
                Picker("Question number", selection: $questionNumber) {
                    ForEach(questionNumbers, id: \.self) {
                        Text(String($0))
                    }
                }
                .pickerStyle(.segmented)
                Text("\(multiplicand) x \(multiplier) = ?")
                Spacer()
                HStack() {
                    ForEach(0..<3) { number in
                        Button {
                            buttonTapped(number)
                        } label: {
                            Text("\(answerArray[Int(number)])")
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                .background(.red)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 20))
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Multiplication Fun")
            .padding(30)
        }


        .onAppear(perform: newQuestion)
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: newQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func generateNumbers() {
        multiplicand = Int.random(in: 2...(highestMultiplicationTable + 2))
        multiplier = Int.random(in: 1...12)
    }
    
    func generateAnswerArray() {
        let correctAnswer = multiplicand * multiplier
        correctAnswerIndex = Int.random(in: 0..<3)
        
        var randomAnswer = 0
        
        answerArray = []
        
        for i in 0..<3 {
            randomAnswer = randomValidAnswer()
            
            while randomAnswer == correctAnswer {
                randomAnswer = randomValidAnswer()
            }
            
            if i == correctAnswerIndex {
                answerArray.append(correctAnswer)
            } else {
                answerArray.append(randomAnswer)
            }
        }
    }
    
    func randomValidAnswer() -> Int {
        return Int.random(in: 2...((highestMultiplicationTable + 2) * 12))
    }
    
    func newQuestion() {
        generateNumbers()
        generateAnswerArray()
    }
    
    func buttonTapped(_ chosenIndex: Int) {
        print("Button \(chosenIndex) tapped.")
        print("chosenIndex: \(chosenIndex)")
        print("correctAnswerIndex: \(correctAnswerIndex)")
        if chosenIndex == correctAnswerIndex {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Correct answer is \(answerArray[correctAnswerIndex])"
        }
        showingScore = true
    }
}

#Preview {
    ContentView()
}
