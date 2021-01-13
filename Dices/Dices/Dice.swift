//
//  Dice.swift
//  Dices
//
//  Created by Marcos Jr on 12/01/21.
//

import SwiftUI

class Dice: ObservableObject {
    
    var value: Int {
        willSet {
            objectWillChange.send()
        }
    }
    private let sides: Int
    
    func roll() {
        self.value = Int.random(in: 1...sides)
    }
    
    init (sides: Int) {
        self.sides = sides
        self.value = Int.random(in: 1...sides)
    }
}
