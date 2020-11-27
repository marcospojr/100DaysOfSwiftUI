//
//  ContentView.swift
//  iFriends
//
//  Created by Marcos Jr on 27/11/20.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var users: FetchedResults<User>

    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: DetailView(user: user)) {
                        VStack(alignment: HorizontalAlignment.leading) {
                            Text(user.uwName)
                                .font(.headline)
                            Text(user.uwEmail)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationBarTitle("iFriends")
        }
        .onAppear(perform: checkDataLoad)
    }

    func checkDataLoad() {
        if users.isEmpty {
            DataInitializer.loadData(moc: moc)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

