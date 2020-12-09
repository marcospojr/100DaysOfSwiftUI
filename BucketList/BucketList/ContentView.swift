//
//  ContentView.swift
//  BucketList
//
//  Created by Marcos Jr on 04/12/20.
//

import MapKit
import LocalAuthentication
import SwiftUI

struct ContentView: View {
    
    @State private var isUnlocked = false
    @State private var isShowingError = false
    @State private var errorMessage = ""
    @State private var errorTitle = ""
    
    var body: some View {
        
        if !isUnlocked {
            Button("Unlock Places") { self.authenticate() }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .alert(isPresented: $isShowingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        } else {
            UnlockedMapView()
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.isShowingError.toggle()
                        self.errorTitle = "Error"
                        self.errorMessage = authenticationError?.localizedDescription ?? "Unknown error"
                    }
                }
            }
        } else {
            errorTitle = "Error"
            errorMessage = "No Biometrics"
            isShowingError.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
