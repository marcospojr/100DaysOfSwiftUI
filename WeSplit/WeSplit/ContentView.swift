//
//  ContentView.swift
//  WeSplit
//
//  Created by Marcos Jr on 13/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalAmount: Double {
        
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount * (tipSelection / 100)
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let grandTotal = totalAmount
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Check value")) {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How many people?")) {
                    Picker("Number of people", selection:
                            $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Total Amount")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                        .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : nil)
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

