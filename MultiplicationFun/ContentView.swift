//
//  ContentView.swift
//  MultiplicationFun
//
//  Created by Woodrow Martyr on 17/1/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var highestMultiplicationTable = 2
    @State private var questionNumber = 5
    
    let questionNumbers = [5, 10, 20]
    
    var body: some View {
        NavigationStack {
            VStack {
                Stepper("Enter the tables number to practice", value: $highestMultiplicationTable, in: 2...12)
                Text("You have chosen to practice tables from 2 to \(highestMultiplicationTable)")
                Picker("How many questions do you want?", selection: $questionNumber) {
                    ForEach(questionNumbers, id: \.self) {
                        Text(String($0))
                    }
                }
                .pickerStyle(.segmented)
                Text("You have chosen to answer \(questionNumber) questions")
            }
            .padding(30)
            .navigationTitle("Multiplication Fun")
        }
    }
}

#Preview {
    ContentView()
}
