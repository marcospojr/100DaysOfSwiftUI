//
//  ContentView.swift
//  WeSplit
//
//  Created by Marcos Jr on 13/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                Group {
                    Text("Hello, world!")
                    Text("Hello, world!")

                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Button("Tap Count \(tapCount)") {
                        self.tapCount += 1
                    }
                }
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(0 ..< students.count) {
                        Text("Row \(self.students[$0])")
                    }
                }
            }
            .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
