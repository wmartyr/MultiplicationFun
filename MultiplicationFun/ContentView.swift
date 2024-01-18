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
            Form {
                Section {
                    Picker("Enter the tables to practice", selection: $highestMultiplicationTable) {
                        ForEach(2..<13) {
                            Text("Up to \($0)")
                        }
                    }
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
                    
                }
            }
            
        }
    }
    
    
}

#Preview {
    ContentView()
}
