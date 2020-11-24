//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Marcos Jr on 24/11/20.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    
    public var wrappedTitle: String {
        return title ?? "Unknown title"
    }

}

extension Movie : Identifiable {

}
