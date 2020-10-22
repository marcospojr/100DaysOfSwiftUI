//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Marcos Jr on 22/10/20.
//

import SwiftUI

extension Image {
    func flagImage() -> some View {
        self
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2 )
   }
}

struct ContentView: View {
    @State private var possibleMoves = ["Rock", "Paper", "Scissors"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var showingScore = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.gray, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 100) {
                Text("Rock, Paper or Scissors?")
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.black)
                
                VStack(spacing: 30) {
                    Text("Choose your move")
                        .fontWeight(.black)
                    HStack {
                        ForEach(0 ..< 3) { number in
                            Button(action: {
                                self.optionTapped(number)
                            }) {
                                Image(self.possibleMoves[number])
                                    .flagImage()
                            }
                        }
                    }
                    
                    Text("Score: \(score)")
                        .font(.title)
                        .fontWeight(.black)
                        .padding()
                    
                    Button(action: {
                        score = 0
                    }){
                        Text("  Reset Score  ")
                            .foregroundColor(.blue)
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                    }
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
            })
        }
    }
    
    func optionTapped (_ number: Int) {
        
        switch true {
        case possibleMoves[correctAnswer] == "Rock" && possibleMoves[number] == "Scissors"
            || possibleMoves[correctAnswer] == "Paper" && possibleMoves[number] == "Rock"
            || possibleMoves[correctAnswer] == "Scissors" && possibleMoves[number] == "Paper":
                scoreTitle = "You lost!"
                score -= 1
        case possibleMoves[correctAnswer] == "Rock" && possibleMoves[number] == "Paper"
            || possibleMoves[correctAnswer] == "Paper" && possibleMoves[number] == "Scissors"
            || possibleMoves[correctAnswer] == "Scissors" && possibleMoves[number] == "Rock":
                scoreTitle = "You won!"
                score += 1
        default:
                scoreTitle = "That's a tie!"
                
        }
        showingScore = true
    }
    
    func askQuestion() {
        correctAnswer = Int.random(in: 0...2)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
