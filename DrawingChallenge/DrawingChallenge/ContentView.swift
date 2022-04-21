//
//  ContentView.swift
//  DrawingChallenge
//
//  Created by Yaroslav Zherebukh on 4/19/22.
//

import SwiftUI

struct ColorCyclingShape: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
            }
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value)/Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct Arrow: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get {insetAmount}
        set {insetAmount = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        path.addLines([
            CGPoint(x: width * 0.4 - insetAmount, y: height),
            CGPoint(x: width * 0.4, y: height * 0.4),
            CGPoint(x: width * 0.2, y: height * 0.4),
            CGPoint(x: width * 0.5, y: height * 0.1),
            CGPoint(x: width * 0.8, y: height * 0.4),
            CGPoint(x: width * 0.6, y: height * 0.4),
            CGPoint(x: width * 0.6, y: height)
        ])
        path.closeSubpath()
        return path
    }
}



struct ContentView: View {
    @State private var insetAmount = 50.0
    var body: some View {
        ZStack {
            Arrow(insetAmount: insetAmount)
                .frame(width: 100, height: 200)
                .onTapGesture {
                    withAnimation {
                        insetAmount = Double.random(in: 13...55)
                    }
            }
            
            ColorCyclingShape()
        }
        
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
