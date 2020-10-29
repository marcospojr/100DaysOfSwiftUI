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
            self.animationAmout += 0.25
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmout)
        .blur(radius: (animationAmout - 1) * 3)
        .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
