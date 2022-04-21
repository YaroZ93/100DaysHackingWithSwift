//
//  ContentView.swift
//  Day19Challenge
//
//  Created by Yaroslav Zherebukh on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var number = 0.0
    @State private var userInput = "meters"
    @State private var userOutput = "feet"
    @FocusState private var amountIsFocused: Bool
    
    var inputUnits = ["meters", "feet", "km", "yards", "miles"]
    
    var outputUnits = ["meters", "feet", "km", "yards", "miles"]
    
    var result: String {
        
        let inputToMetersMultiplier: Double
        let metersToOutputMultiplier: Double
        
        switch userInput {
        case "Feet":
            inputToMetersMultiplier = 0.3048
        case "km":
            inputToMetersMultiplier = 1000
        case "yards":
            inputToMetersMultiplier = 0.9144
        case "miles":
            inputToMetersMultiplier = 1609.34
        default:
            inputToMetersMultiplier = 1.0
        }
        
        switch userOutput {
        case "Feet":
            metersToOutputMultiplier = 3.28084
        case "km":
            metersToOutputMultiplier = 0.001
        case "yards":
            metersToOutputMultiplier = 1.09361
        case "miles":
            metersToOutputMultiplier = 0.000621371
        default:
            metersToOutputMultiplier = 1.0
        }
        
        let inputInMeters = number * inputToMetersMultiplier
        
        let output = inputInMeters * metersToOutputMultiplier
        
        let outputString = output.formatted()

        return "\(outputString)"
    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section {
                    TextField("Amount", value: $number, format: .number).keyboardType(.decimalPad).focused($amountIsFocused)
                    
                } header: {
                    Text("Pick a number")
                }
                
                Section {
                    Picker("user input", selection: $userInput) {
                        ForEach(inputUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("Select input")
                }
                
                
                
                Section {
                    Picker("user output", selection: $userOutput) {
                        ForEach(outputUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("Select output")
                }
                
                Section {
                    Text("The result is \(result)")
                }
                
                
                
                
            }
            
            .navigationTitle("ConvertUnits")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
    }
}
