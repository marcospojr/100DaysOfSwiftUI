//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Marcos Jr on 13/01/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("New secondary")) {
                Text("Hello, World!")
            }
            .navigationBarTitle("Primary")

            Text("Secondary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
