//
//  ContentView.swift
//  iExpense
//
//  Created by Marcos Jr on 02/11/20.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct User: Codable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    @State private var showingSheet = false

    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }

                VStack(spacing: 30) {
                    Button("Add Number") {
                        self.numbers.append(self.currentNumber)
                        self.currentNumber += 1
                    }

                    Button("Show sheet") {
                        self.showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        SecondView(name: "@marcospojr")
                    }
                    
                    Button("Tap count: \(tapCount)") {
                        self.tapCount += 1
                        UserDefaults.standard.set(self.tapCount, forKey: "Tap")
                    }
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
