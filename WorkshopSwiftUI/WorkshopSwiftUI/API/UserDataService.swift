//
//  UserDataService.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import Foundation

protocol UserDataService {
    func getUsers(completion: @escaping (Result<[User], WorkshopError>) -> Void)
}

class WorkshopUserDataService: UserDataService {
    func getUsers(completion: @escaping (Result<[User], WorkshopError>) -> Void) {
        DispatchQueue.main.async {
            COLLECTION_USERS.order(by: "username", descending: false).getDocuments { snapshot, _ in
                guard let document = snapshot?.documents else {
                    completion(.failure(.couldntFetchUsers))
                    return
                }
                let users = document.compactMap({ try? $0.data(as: User.self)})
                completion(.success(users))
            }
        }
    }
}
