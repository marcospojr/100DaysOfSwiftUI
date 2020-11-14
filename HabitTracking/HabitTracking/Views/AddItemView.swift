//
//  HabitView.swift
//  HabitTracking
//
//  Created by Marcos Jr on 13/11/20.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var habits: Habbits
    
    @State var itemTitle: String = ""
    @State var itemDescription: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Item Title", text: $itemTitle)
                TextField("Item Description", text: $itemDescription)
            }
            .navigationBarTitle("Add New Item")
            .navigationBarItems(trailing: Button("Save") {
                if self.itemTitle != "" {
                let newItem = HabitItem(title: self.itemTitle, description: self.itemDescription, logs: 0)
                self.habits.items.append(newItem)
                self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}
