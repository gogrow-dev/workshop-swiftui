//
//  User.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 24/08/2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let username: String
    let email: String
    
    static let `default` = User(username: "john_smith", email: "john@gmail.com")
}
