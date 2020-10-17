//
//  ContentView.swift
//  WeConvert
//
//  Created by Marcos Jr on 16/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature = ""
    
    @State private var selectedInput = 2
    @State private var selectedOutput = 2
    
    let temperaturesInput = ["Celsius", "Fahrenheit", "Kelvin"]
    let temperaturesOutput = ["Celsius", "Fahrenheit", "Kelvin"]
    

    var convertedTemperature: Double {
        let current = Double(temperature) ?? 0
        let inputTemperature = temperaturesInput[selectedInput]
        let outputTemperature = temperaturesOutput[selectedOutput]
        var finalValue: Double

        switch inputTemperature {
        case "Celsius":
            if outputTemperature == "Fahrenheit" {
                finalValue = (current * 9/5) + 32
                return finalValue
            } else if outputTemperature == "Kelvin" {
                finalValue = current + 273.15
                return finalValue
            } else {
                return current
            }
        case "Fahrenheit":
            if outputTemperature == "Celsius" {
                finalValue = (current - 32) * 5/9
                return finalValue
            } else if outputTemperature == "Kelvin" {
                finalValue = (current - 32) * 5/9 + 273.15
                return finalValue
            } else {
                return current
            }
        default:
            if outputTemperature == "Fahrenheit" {
                finalValue = (current - 273.15) * 9/5 + 32
                return finalValue
            } else if outputTemperature == "Celsius" {
                finalValue = current - 273.15
                return finalValue
            } else {
                return current
            }
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Convert Temperature")) {
                    TextField("Value you want to convert", text: $temperature)
                    Picker("FromTemperature", selection: $selectedInput) {
                        ForEach(0 ..< temperaturesInput.count) {
                            Text("\(self.temperaturesInput[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Result")) {

                    Picker("Tip percentage", selection: $selectedOutput) {
                        ForEach(0 ..< temperaturesOutput.count) {
                            Text("\(self.temperaturesOutput[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("\(convertedTemperature, specifier: "%.2f")")
                }
                
                
//                Section(header: Text("Amount per person")) {
//                    Text("$\(totalPerPerson)")
//                }
                
//                Section(header: Text("Total Amount")) {
//                    Text("$\(totalAmount, specifier: "%.2f")")
//                }
            }
            .navigationBarTitle("WeConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
