//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Marcos Jr on 24/11/20.
//

import CoreData
import SwiftUI

struct FilteredList: View {
    var fetchRequest: FetchRequest<Singer>
    var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }

    var body: some View {
        List(singers, id: \.self) { singer in
            Text("\(singer.wrappedLastName) \(singer.wrappedFirstName)")
        }
    }

    init(sort: NSSortDescriptor, predicate: BeginsWith, filter: String) {
        var predicateValue : String {
            switch predicate {
            case .lastName:
                return "lastName"
            case .firstName:
                return "firstName"
            }
        }
        
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [sort], predicate: NSPredicate(format: "%K BEGINSWITH %@", predicateValue, filter))
    }
}
