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
    
    @State private var correctRotation = 0.0
    @State private var opacityAmount = 1.0
    
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
                            .flagImage()
                    }
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
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        scoreTitle = ""
        opacityAmount = 1.0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    static func requireUserAtencion(on onView: UIView) {
        let animation = CABasicAnimation(keyPath: "position")
        
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        
        animation.fromValue = NSValue(cgPoint: CGPoint(x: onView.center.x - 10, y: onView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: onView.center.x + 10, y: onView.center.y))
        
        onView.layer.add(animation, forKey: "position")    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
