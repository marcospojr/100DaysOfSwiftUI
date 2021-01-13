//
//  DiceView.swift
//  Dices
//
//  Created by Marcos Jr on 12/01/21.
//

import SwiftUI

struct DiceView: View {
    

    var body: some View {
        TabView{
            ZStack {
                    DiceView()
                    .tabItem {
                        Image(systemName: "square")
                        Text("Roll")
                        }
            }
            HistoricView()
                    .tabItem {
                        Image(systemName: "chart.bar")
                        Text("Results")
                    }
                }
            }
        }

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}


