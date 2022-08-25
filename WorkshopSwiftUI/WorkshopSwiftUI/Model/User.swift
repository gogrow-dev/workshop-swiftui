//
//  User.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 24/08/2022.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    //let uid: String
    //@DocumentID var id: String?
    var bio: String?
    var stats: UserStats?
    var isFollowed: Bool? = false
    
    //var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}

struct UserStats: Codable {
    var following: Int
    var posts: Int
    var followers: Int
}
