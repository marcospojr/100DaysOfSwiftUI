//
//  HistoricView.swift
//  Dices
//
//  Created by Marcos Jr on 12/01/21.
//

import SwiftUI

struct HistoricView: View {
    
    @ObservedObject var diceOne = Dice(sides: 6)
    @ObservedObject var diceTwo = Dice(sides: 6)
    @EnvironmentObject var scores: UserScore
       
       var body: some View {
           NavigationView {
               List {
                ForEach(scores.allScores, id: \.self) { roll in
                       HStack {
                           Text("Roll ")
                           ForEach(roll, id: \.self) { score in
                               Image(systemName: "\(score).square")
                           }
                           Text("Score \(self.rollScore(roll))")
                       }
                       .font(.headline)
                       .accessibilityElement(children: .ignore)
                       .accessibility(label: Text("Rolled \(self.rollDescription(roll)) to score \(self.rollScore(roll))"))
                   }
               }
               .navigationBarTitle("Latest Rolls", displayMode: .inline)
           }
       }
       
       func rollScore(_ roll: [Int]) -> Int {
           guard roll.count > 0 else { return 0 }
           
           return roll.reduce(0, +)
       }

       func rollDescription(_ roll: [Int]) -> String {
           guard roll.count > 0 else { return "nothing" }
           
           if roll.count == 1 { return String(roll[0]) }
           
           var description = ""
           for value in roll {
               description += " " + String(value)
           }
           return description
       }
}
