//
//  ContentView.swift
//  Edutainment
//
//  Created by Marcos Jr on 01/11/20.
//

import SwiftUI

struct Question: Hashable {
    let text: String
    let answer: String
    var correction: String
}


struct ContentView: View {
    @State private var multiplicationTable = 1
    @State private var numberQuestions = 0
    @State private var isActive = false
    @State private var questions: [Question] = []
    @State private var answers: [String] = []
    
    
    var body: some View {
        NavigationView {
            Group {
                if !isActive {
                    Form {
                        Section(header: Text("Which number you want to practice?")) {
                            Stepper(value: $multiplicationTable, in: 1...12) {
                                Text("\(multiplicationTable)")
                            }
                        }
                        
                        Section(header: Text("How many questions do you want to answer ?")) {
                            Stepper(value: $numberQuestions, in: 0...20, step: 5) {
                                Text("\(numberQuestions)")
                            }
                        }
                    }
                } else {
                    List(0..<questions.count) {
                        Text(questions[$0].text)
                            .padding()
                        
                        TextField("answer", text: $answers[$0])
                            .padding()
                        
                        Text(questions[$0].correction)
                            .padding()
                            .foregroundColor(questions[$0].correction == "right" ? Color.green : Color.red)
                    }
                }
            }
            .navigationTitle("Multiplication table")
            .navigationBarItems(leading: Button(action: returnHome) {
                Text(isActive ? "Return" : "")
            } ,trailing: Button(action: isActive ?  verificateAnswer : start) {
                Text(isActive ? "Check" : "Start")
            })
        }
    }
    
    func start() {
        isActive = true
        
        for _ in 0..<numberQuestions {
            let numberRandom = Int.random(in: 0...10)
            let answer = multiplicationTable * numberRandom
            let question = Question(text: "\(multiplicationTable) x \(numberRandom) = ", answer: String(Int(answer)), correction: "")
            
            questions.append(question)
            answers.append("")
        }
    }
    
    func verificateAnswer() {
        for (index, question) in questions.enumerated() {
            if question.answer == answers[index] {
                questions[index].correction = "right"
            } else {
                questions[index].correction = "wrong"
            }
        }
    }
    
    func returnHome() {
        isActive = false
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
