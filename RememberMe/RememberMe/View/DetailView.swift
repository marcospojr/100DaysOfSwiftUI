//
//  DetailView.swift
//  RememberMe
//
//  Created by Marcos Jr on 13/12/20.
//

import SwiftUI

struct DetailView: View {
    var user: User
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                self.user.wrappedImage
                .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: geometry.size.width/2, maxHeight: geometry.size.width * 3 / 4)
                Text(self.user.wrappedName)
                    .font(.headline)
                MapView(location: self.user.userLocation)

            }
        .padding()
        }
        
    }
}

