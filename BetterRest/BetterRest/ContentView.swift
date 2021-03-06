//
//  ContentView.swift
//  BetterRest
//
//  Created by Yaroslav Zherebukh on 1/26/22.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var whenToWakeUp: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            return "Your ideal wake up time is " + sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
           return "There was an error"
        }
    
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("When do you want to wake up?").font(.headline)) {
                    
                    DatePicker("Please enter time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
            
                Section(header: Text("Desired amount of sleep").font(.headline)) {
                    Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section(header: Text("Daily coffee intake").font(.headline)) {
                    Picker("Number of cups", selection: $coffeeAmount) {
                        ForEach(1..<21) {
                            Text("\($0)")
                        }
                    }
                    
                    // Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount)  cups", value: $coffeeAmount, in: 1...20)
                }
                
                Section {
                    Text(whenToWakeUp)
                }
            }
            .navigationTitle("BetterRest")
        }
    }
    
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

