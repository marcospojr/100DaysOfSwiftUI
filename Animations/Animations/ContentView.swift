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
        Button("Tap Me") {
            self.animationAmout += 0.5
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmout)
                .opacity(Double(2 - animationAmout))
                .animation(
                    Animation.easeInOut(duration: 1)
        //                .delay(1)
        //                .repeatCount(3, autoreverses: true)
                        .repeatForever(autoreverses: false)
                )
        )
        .onAppear {
            self.animationAmout = 2
        }
//        .scaleEffect(animationAmout)
//        .blur(radius: (animationAmout - 1) * 3)
//        .animation(.default)
//        .animation(.easeOut)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
