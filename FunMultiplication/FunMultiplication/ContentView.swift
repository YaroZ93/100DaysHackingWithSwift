//
//  ContentView.swift
//  FunMultiplication
//
//  Created by Yaroslav Zherebukh on 3/28/22.
//

import SwiftUI

struct Question {
    var text: String
    var answer: Int
}

struct ContentView: View {
    
    @State private var imageName = ["parrot", "duck", "dog", "horse", "rabbit", "whale", "rhino", "elephant", "zebra", "chicken", "cow", "panda", "hippo", "gorrila", "owl", "penguin", "sloth", "frog", "chicken", "cow", "monkey", "giraffe", "moose", "snake", "pig", "bear", "walrus", "goat", "crocodile"]
    
    @State private var gameRunning = false
    @State private var multiplicationTables = 1
    let allMultiplicationTables = Range(1...12)
    @State private var questionCounter = "5"
    let questionOptions = ["5", "10", "20", "All"]
    
    @State private var arrayOfQuestions = [Question(text: "1 * 1", answer: 1), Question(text: "2*2", answer: 4), Question(text: "3*3", answer: 9), Question(text: "5*5", answer: 25)]
    
    @State private var currentQuestion = 0
    
    @State private var totalScore = 0
    @State private var remainingQuestions = 0
    @State private var selectedNumber = 0
    
    @State private var isCorrect = false
    @State private var isWrong = false
    
    @State private var isShowingAlert = false
    @State private var alertTitle = ""
    @State private var buttonAlertTitle = ""
    
    @State private var isWinGame = false
    
    //let testArrayOfQuestions = [Question(text: "1 * 1", answer: 1), Question(text: "2*2", answer: 4), Question(text: "3*3", answer: 9)]
    //
    
    var body: some View {
        Group {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
                if gameRunning {
                    VStack {
                        Text(arrayOfQuestions[currentQuestion].text)
                        
                        VStack {
                            ForEach(0..<4, id: \.self) { number in
                                HStack {
                                    Button(action: {}) {
                                        Image(imageName[number])
                                        Text("Variant of an image ")
                                    }
                                    
                                }
                            }
                        }
                        Button(action: {
                            gameRunning = false
                        }) {
                            Text("End Game")
                        }

                        Spacer()
                        
                    }
                }
                else {
                    VStack {
                        Text("Pick multiplication table to practice")
                        Picker("Pick multiplication table to practice", selection: $multiplicationTables) {
                            ForEach(allMultiplicationTables, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(.segmented)
                        
                        VStack {
                            Text("How many questions would you like to be asked?")
                            
                            Picker("How many questions would you like to be asked?", selection: $questionCounter) {
                                ForEach(questionOptions, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            Button("Start Game") {
                                gameRunning = true
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(.segmented)
                    }
                }
            }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


