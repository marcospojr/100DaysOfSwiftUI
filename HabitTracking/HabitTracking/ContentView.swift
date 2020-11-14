//
//  ContentView.swift
//  HabitTracking
//
//  Created by Marcos Jr on 13/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var habits = Habbits()
    
    @State private var showingAddItem = false
    
    func delete(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(habits.items) { habitItem in
                    NavigationLink(destination: HabitView(habits: self.habits, selectedItem: habitItem )) {
                        HStack {
                            Text("\(habitItem.title)")
                            Spacer()
                            Text("\(habitItem.logs)")
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle("HabitTracking")
            .navigationBarItems(trailing:
            Button(action: {
                self.showingAddItem = true
            }) {
                Text("Add item")
            })
        }
        .sheet(isPresented: $showingAddItem) {
            AddItemView(habits: self.habits)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
