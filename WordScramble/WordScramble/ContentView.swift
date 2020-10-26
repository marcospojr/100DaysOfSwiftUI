//
//  ContentView.swift
//  WordScramble
//
//  Created by Marcos Jr on 26/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // we found the file in our bundle
            if let fileContentes = try?
                String(contentsOf: fileURL) {
                // we loaded the file into a string
            }
        }
        
        return Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
