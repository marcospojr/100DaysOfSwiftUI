//
//  ContentView.swift
//  RememberMe
//
//  Created by Marcos Jr on 13/12/20.
//

import CoreImage
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    
    @State private var showingImagePicker = false
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
        
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
        
    var body: some View {
        
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                
                HStack {
                    
                    Spacer()
                    
                    Button("Save") {
                        guard let processedImage = self.processedImage else {
                            alertTitle = "Oops!"
                            alertMessage = "You have to select an image first!"
                            self.showingAlert = true
                            return
                        }
                        
                        let imageSaver = ImageSaver()
                        
                        imageSaver.sucessHandler = {
                            print("Success!")
                            alertTitle = "Success!"
                            alertMessage = "Image saved successfully!"
                            self.showingAlert = true
                        }
                        
                        imageSaver.errorHandler = {
                            print("Oops: \($0.localizedDescription)")
                        }
                        
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Remember Me")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
