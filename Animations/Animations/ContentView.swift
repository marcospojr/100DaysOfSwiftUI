//
//  ContentView.swift
//  Animations
//
//  Created by Marcos Jr on 29/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmout: CGFloat = 1
    var body: some View {
        
        VStack {
            Stepper("Scale amount", value: $animationAmout.animation(
                Animation.easeOut(duration: 3).repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmout += 1
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmout)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
