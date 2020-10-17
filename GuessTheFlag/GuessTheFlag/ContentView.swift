//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Marcos Jr on 17/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .red]), center: .center)
            Button("Show Alert") {
                    self.showingAlert = true
                }
            .foregroundColor(.black)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
