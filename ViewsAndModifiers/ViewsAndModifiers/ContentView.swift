//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Marcos Jr on 20/10/20.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct CapsuleButton: View {
    @State private var useRedText = false
    var text: String
    
    var body: some View {
        Button(text) {
            self.useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        GridStack(rows: 8, columns: 3) { row, col in
            CapsuleButton(text: "BT \(row * 3 + col)")
                .titleStyle()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
