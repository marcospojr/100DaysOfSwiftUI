//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Marcos Jr on 24/11/20.
//

import CoreData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State var filterValue = "A"
    
    var body: some View {
        VStack {
            FilteredList(sort: NSSortDescriptor(keyPath: \Singer.lastName, ascending: true), predicate: .lastName, filter: filterValue)
                HStack {
                Button("Add Examples") {
                    addExamples()
                }

                Button("Show A") {
                    self.filterValue = "A"
                }

                Button("Show S") {
                    self.filterValue = "S"
                }
            }
        }
    }
    
    func addExamples() {
        let taylor = Singer(context: self.moc)
        taylor.firstName = "Taylor"
        taylor.lastName = "Swift"

        let ed = Singer(context: self.moc)
        ed.firstName = "Ed"
        ed.lastName = "Sheeran"

        let adele = Singer(context: self.moc)
        adele.firstName = "Adele"
        adele.lastName = "Adkins"
        
        let luan = Singer(context: self.moc)
        luan.firstName = "Luan"
        luan.lastName = "Santana"
        
        let alejandro = Singer(context: self.moc)
        alejandro.firstName = "Alejandro"
        alejandro.lastName = "Sanz"
        
        let ivete = Singer(context: self.moc)
        ivete.firstName = "Ivete"
        ivete.lastName = "Sangalo"
        
        let bryan = Singer(context: self.moc)
        bryan.firstName = "Bryan"
        bryan.lastName = "Adams"
        
        let xand = Singer(context: self.moc)
        xand.firstName = "Xand"
        xand.lastName = "Avião"

        try? self.moc.save()
    }
}

enum BeginsWith {
    case lastName
    case firstName
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
