//
//  ContentView.swift
//  WeSplit2
//
//  Created by Yaroslav Zherebukh on 1/16/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let localCurrency:FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    
    
    var grandTotal:Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        return checkAmount + tipValue

    }
    
    
    var totalPerPerson: Double {
        grandTotal/Double(numberOfPeople + 2)
    }
  
    var body: some View {
        
        NavigationView {
        Form {
            Section {
                TextField("Amount", value: $checkAmount, format: localCurrency).keyboardType(.decimalPad).focused($amountIsFocused)
                    .foregroundColor(tipPercentage == 0 ? .red : .black)
                
                
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
        }
            
            Section {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0..<100, id: \.self) {
                        Text($0, format: .percent)
                            
                    }
                }
                
            } header: {
                Text("How much tip would you like to leave?")
            }
            
            Section {
                Text(grandTotal, format: localCurrency)
            } header: {
                Text("Grand Total")
            }
            
            Section {
                Text(totalPerPerson, format: localCurrency)
            } header: {
                Text("Amount per person")
            }
            
           
        .navigationTitle("WeSplit")
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
                          }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
        
    }
}

                          


