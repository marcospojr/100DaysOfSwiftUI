//
//  User+CoreDataProperties.swift
//  RememberMe
//
//  Created by Marcos Jr on 14/12/20.
//
//

import Foundation
import CoreData
import SwiftUI
import MapKit


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var imageData: Data?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?

    var wrappedName: String {
        get {
            name ?? "UnknowName"
        }
    }
    
    var wrappedImage: Image {
        get {
            (imageData != nil) ? Image(uiImage: UIImage(data: imageData!)!) : Image(systemName: "contacts")
        }
    }
    
    var userLocation: CLLocationCoordinate2D {
        get {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
}

extension User : Identifiable {

}

