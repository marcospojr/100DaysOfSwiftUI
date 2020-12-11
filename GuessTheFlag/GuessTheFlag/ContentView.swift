//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Marcos Jr on 17/10/20.
//

import SwiftUI

let labels = [
    "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
    "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
    "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
    "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
    "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
    "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
    "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
    "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
    "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
    "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
    "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
]

extension Image {
    func flagImage(number: Int, countries: [String]) -> some View {
        self
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2 )
            .accessibility(label: Text(labels[countries[number], default: "Unknown flag"]))
   }
}

struct ContentView: View {

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()

    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var correctRotation = 0.0
    @State private var opacityAmount = 1.0
    @State private var buttonSelected = false
    
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
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(scoreTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                ForEach(0 ..< 3) { number in
                    Button(action:  {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .flagImage(number: number, countries: countries)
                    }
                    .animation(Animation.default.repeatCount(5).speed(3))
                    .opacity(number == correctAnswer ? 1 : opacityAmount )
                    .rotation3DEffect(.degrees(number == correctAnswer ? correctRotation : 0.0),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                }
                
                Spacer()
                
                Button("Continue") {
                    self.askQuestion()
                }
                
                Spacer()
            }
        }
    }
    
    func flagTapped (_ number: Int) {
        
        if number == correctAnswer {
            opacityAmount = 0.75
            scoreTitle = "Correct (+100)"
            score += 100
            withAnimation(.interpolatingSpring(stiffness: 20, damping: 5)) {
                if number == correctAnswer {
                    self.correctRotation += 360
                }
            }
        } else if score == 0{
            scoreTitle = "Wrong! That's \(countries[number])'s flag!"
        } else {
            scoreTitle = "Wrong! That's \(countries[number])'s flag! (-50)"
            score -= 50
            withAnimation(.easeInOut) {
                self.buttonSelected = true
            }
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        scoreTitle = ""
        opacityAmount = 1.0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
