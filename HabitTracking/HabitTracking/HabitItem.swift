//
//  HabitItem.swift
//  HabitTracking
//
//  Created by Marcos Jr on 13/11/20.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
    var logs: Int
}

class Habbits: ObservableObject {
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "items") {
            if let savedItems = try? JSONDecoder().decode([HabitItem].self, from: items) {
                self.items = savedItems
                return
            }
        }
        self.items = []
    }
    
    @Published var items: [HabitItem] {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
}
