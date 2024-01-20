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
    @State private var answerArray = [Int]()
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
            }
        }
    }
    
    func generateNumbers() {
        multiplicand = Int.random(in: 1..<(highestMultiplicationTable + 3))
        multiplier = Int.random(in: 2..<(highestMultiplicationTable + 3))
    }
    
    func generateAnswerArray() {
        correctAnswerIndex = Int.random(in: 0..<3)
        for i in 0..<3 {
            if i == correctAnswerIndex {
                answerArray.append(multiplicand * multiplier)
            } else {
                answerArray.append(Int.random(in: 2...(highestMultiplicationTable * highestMultiplicationTable)))
            }
        }
    }
    
}

#Preview {
    ContentView()
}
