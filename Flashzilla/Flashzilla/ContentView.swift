//
//  ContentView.swift
//  Flashzilla
//
//  Created by Marcos Jr on 22/12/20.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var counter = 0

    var body: some View {
        CardView(card: Card.example)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
