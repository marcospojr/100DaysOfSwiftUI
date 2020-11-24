//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Marcos Jr on 24/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach([2, 4, 6, 8, 10], id: \.self) {
                Text("\($0) is even")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
