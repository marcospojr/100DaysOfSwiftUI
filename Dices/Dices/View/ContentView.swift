//
//  ContentView.swift
//  Dices
//
//  Created by Marcos Jr on 12/01/21.
//

import SwiftUI

struct ContentView: View {
    var scores = UserScore()
    
    var body: some View {
        TabView {
            RollView()
                .tabItem {
                    Image(systemName: "square")
                    Text("Roll Dice")
                }
            HistoricView()
                .tabItem {
                    Image(systemName: "clock.arrow.circlepath")
                    Text("Historic")
                }
        }.environmentObject(scores)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
