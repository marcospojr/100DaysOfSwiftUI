//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Marcos Jr on 17/10/20.
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
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action:  {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .flagImage()
                    }
                }
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
            })
        }
    }
    
    func flagTapped (_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct (+100)"
            score += 100
        } else if score == 0{
            scoreTitle = "Wrong! That's \(countries[number])'s flag!"
        } else {
            scoreTitle = "Wrong! That's \(countries[number])'s flag! (-50)"
            score -= 50
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
