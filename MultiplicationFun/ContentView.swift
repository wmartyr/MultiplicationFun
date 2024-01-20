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
    @State private var multiplier = 2
    @State private var score = 0
    @State private var answerArray = [0, 0, 0]
    @State private var correctAnswerIndex = 0
    
    let questionNumbers = [5, 10, 20]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Enter the tables to practice", selection: $highestMultiplicationTable) {
                        ForEach(2..<13) {
                            Text("Up to \($0)")
                        }
                    }
                    .onChange(of: highestMultiplicationTable){
                        generateNumbers()
                        generateAnswerArray()
                    }
                    Text("number is: \(highestMultiplicationTable + 2)")
                }
                Section("How many questions do you want") {
                    Picker("Question number", selection: $questionNumber) {
                        ForEach(questionNumbers, id: \.self) {
                            Text(String($0))
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    Text("\(multiplicand) x \(multiplier) = ?")
                }
                HStack(spacing: 20) {
                    ForEach(0..<3) { answerIndex in
                        Button {
                        } label: {
                            Text("\(answerArray[Int(answerIndex)])")
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                .background(.red)
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
    }
    
    func generateNumbers() {
        multiplicand = Int.random(in: 1..<(highestMultiplicationTable + 3))
        multiplier = Int.random(in: 2..<(highestMultiplicationTable + 3))
    }
    
    func generateAnswerArray() {
        let correctAnswer = multiplicand * multiplier
        
        var randomAnswer = 0
        
        answerArray = []
        correctAnswerIndex = Int.random(in: 0..<3)
        
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
        return Int.random(in: 2...(highestMultiplicationTable * highestMultiplicationTable))
    }
}

#Preview {
    ContentView()
}
