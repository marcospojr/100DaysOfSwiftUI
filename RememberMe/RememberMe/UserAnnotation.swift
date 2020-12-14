//
//  UserAnnotation.swift
//  RememberMe
//
//  Created by Marcos Jr on 14/12/20.
//

import Foundation
import MapKit


class UserAnnotation:  MKPointAnnotation {

    override init() {
        super.init()
    }
    
    init(_ coordinate: CLLocationCoordinate2D) {
        super.init()
        self.coordinate = coordinate
    }
}
