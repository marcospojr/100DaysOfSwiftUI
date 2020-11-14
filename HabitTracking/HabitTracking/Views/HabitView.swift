//
//  HabitView.swift
//  HabitTracking
//
//  Created by Marcos Jr on 13/11/20.
//

import SwiftUI

struct HabitView: View {
    
    @ObservedObject var habits: Habbits
    @State var selectedItem: HabitItem
    
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Text(selectedItem.title)
                .font(.system(size: 50, weight: .bold))
                .multilineTextAlignment(.center)
            Text(selectedItem.description)
                .font(.system(size: 30))
            .multilineTextAlignment(.center)
            Text("\(selectedItem.logs)")
                .font(.system(size: 35))
            
            Stepper("Logged", value: self.$selectedItem.logs, in: 0...100) { _ in
                self.saveHabit()
                print(selectedItem.logs)
            }
            .labelsHidden()
            Spacer()
        }
        .padding()
    }
    
    func saveHabit() {
        guard let index = habits.items.firstIndex(where: {$0.id == selectedItem.id }) else { return }
        habits.items[index].logs = selectedItem.logs
    }
}
