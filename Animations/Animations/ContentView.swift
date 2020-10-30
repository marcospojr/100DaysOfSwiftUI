//
//  ContentView.swift
//  Animations
//
//  Created by Marcos Jr on 29/10/20.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    
    @State private var enabled = false
    @State private var enabledHello = false
    @State private var dragAmount = CGSize.zero
    @State private var dragAmountHello = CGSize.zero
    
    @State private var isShowingRed = false
    
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { num in
                    Text(String(self.letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(self.enabledHello ? Color.blue : Color.red)
                        .offset(self.dragAmountHello)
                        .animation(Animation.default.delay(Double(num) / 20))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmountHello = $0.translation }
                    .onEnded { _ in
                        self.dragAmountHello = .zero
                        self.enabledHello.toggle()
                    }
            )
            
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { self.dragAmount = $0.translation }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                self.dragAmount = .zero }
                        }
                )
            
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.scale)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
