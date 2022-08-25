//
//  User.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 24/08/2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let fullname: String
    let username: String
    let email: String
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
    static let `default` = User(fullname: "John Smith", username: "john_smith", email: "john@gmail.com")
}
