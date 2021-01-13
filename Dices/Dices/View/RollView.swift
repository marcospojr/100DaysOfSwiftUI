//
//  RollView.swift
//  Dices
//
//  Created by Marcos Jr on 12/01/21.
//

import SwiftUI

struct RollView: View {
    
    @ObservedObject var diceOne = Dice(sides: 6)
    @ObservedObject var diceTwo = Dice(sides: 6)
    @EnvironmentObject var scores: UserScore
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 150) {
                HStack {
                    DiceAnimationView(dice: diceOne)
                    .padding()
                    .accessibility(label: Text("\(diceOne.value)"))

                    DiceAnimationView(dice: diceTwo)
                    .padding()
                    .accessibility(label: Text("\(diceTwo.value)"))
                }
                                
                Button(action: {
                    self.diceOne.roll()
                    self.diceTwo.roll()
                    self.scores.allScores.insert([self.diceOne.value, self.diceTwo.value], at: 0)
                }) {
                    Text("Roll")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(.white))
                        .accessibility(label: Text("Roll the dice"))
                }
            }
        }
    }
}


struct DiceAnimationView: View {
    @State private var rotateAnimationAmount = Double(Int.random(in: -8...8))
    @State private var change = false
    @ObservedObject var dice: Dice
    
    var body: some View {
        Text(String(dice.value))
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.bold)
            .opacity(change ? 0.0 : 1.0)
            .transition(.opacity)
            .frame(width: 100, height: 100)
            .background(Color.blue)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(.black))
            .shadow(color: .black, radius: 4, x: 0, y: 0)
            .rotation3DEffect(.degrees(rotateAnimationAmount), axis: (x: 0, y: 0, z: 1))
            .onReceive(dice.objectWillChange) { _ in
                self.change = true
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    self.rotateAnimationAmount += self.randomSigned(330)
                }
                withAnimation(Animation.easeIn(duration: 1).delay(0.3)) {
                    self.change = false
                }
        }
    }
    
    func randomSigned(_ value: Double) -> Double {
        return Double(Int.random(in: 1...2) * 2 - 3) * value
    }
}
