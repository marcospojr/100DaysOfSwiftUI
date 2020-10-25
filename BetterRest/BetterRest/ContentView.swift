//
//  ContentView.swift
//  BetterRest
//
//  Created by Marcos Jr on 23/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmout = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var bedTime: String {
        calculateBedtime()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("When do yout want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time",
                               selection: $wakeUp,
                               displayedComponents:
                                .hourAndMinute)
                }
                       
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper(value: $sleepAmout, in: 4...12, step: 0.25) {
                        Text("\(sleepAmout, specifier: "%g") hours")
                    }
                }
                       
                Section {
                    Text("Dayli coffee intake")
                        .font(.headline)
                    
                    Picker("", selection: $coffeAmount) {
                        ForEach(0 ..< 21) { coffeAmount in
                            if coffeAmount == 1 {
                                Text("1 cup")
                            } else if coffeAmount > 1 {
                                Text("\(coffeAmount) cups")
                            }
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                                        
//                    Stepper(value: $coffeAmount, in: 1...20) {
//                        if coffeAmount == 1 {
//                            Text("1 cup")
//                        } else {
//                            Text("\(coffeAmount) cups")
//                        }
//                    }
                }
                
                VStack {
                    Text("Your ideal bedtime is \(bedTime)")
                        .font(.headline)
                }
                
            }
            .navigationBarTitle("BetterRest")
//            .navigationBarItems(trailing:
//                Button(action: calculateBedtime) {
//                    Text("Calculate")
//                }
//            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedtime() -> String {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmout, coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "Your ideal bedtime is..."
            
            return formatter.string(from: sleepTime)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
            return ""
        }
        
//        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
