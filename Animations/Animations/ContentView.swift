//
//  ContentView.swift
//  Animations
//
//  Created by Marcos Jr on 29/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    @State private var animationAmountOverlay: CGFloat = 1
    @State private var animationAmount3D = 0.0
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 50) {
            Spacer()
            
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeOut(duration: 3).repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
                        
            Button("Tap Me") {
                self.animationAmount += 0.5
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.red)
                    .scaleEffect(animationAmountOverlay)
                    .opacity(Double(2 - animationAmountOverlay))
                    .animation(
                        Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: false)
                    )
            )
            .scaleEffect(animationAmount)
            .animation(.easeInOut)
            .onAppear {
                self.animationAmountOverlay = 2
            }
            
            Spacer()
            
            Text("3D Rotation")
                .font(.largeTitle)
                .fontWeight(.black)
                        
            Button("Tap Me 3D") {
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    self.animationAmount3D += 360
                }
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(
                .degrees(animationAmount3D),
                axis: (x: 0.0, y: 1.0, z: 0.0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
