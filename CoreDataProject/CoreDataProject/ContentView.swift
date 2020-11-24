//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Marcos Jr on 24/11/20.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>

    var body: some View {
        List(wizards, id: \.self) { wizard in
            Text(wizard.name ?? "Unkown")
        }
        
        Button("Add") {
            let wizard = Wizard(context: self.moc)
            wizard.name = "Harry Potter"
        }
        
        Button("Save") {
            do {
                try self.moc.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
