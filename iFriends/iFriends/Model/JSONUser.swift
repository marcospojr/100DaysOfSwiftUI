//
//  User.swift
//  iFriends
//
//  Created by Marcos Jr on 27/11/20.
//

import Foundation

struct JSONUser: Codable, Identifiable {
    var id: String
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var friends: [JSONFriend]
}
