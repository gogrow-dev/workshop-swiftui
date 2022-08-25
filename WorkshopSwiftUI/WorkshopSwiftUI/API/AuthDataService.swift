//
//  AuthDataService.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 24/08/2022.
//

import Foundation
import Firebase

protocol AuthDataService {
    func login(with userInfo: UserInfo, completion: @escaping (Result<FirebaseAuth.User, WorkshopError>) -> Void)
    func register(with userInfo: UserInfo, completion: @escaping (Result<FirebaseAuth.User, WorkshopError>) -> Void)
    func resetPassword(for email: String, completion: @escaping (Result<WorkshopSuccess, WorkshopError>) -> Void)
}

class WorkshopAuthDataService: AuthDataService {
    
    func login(with userInfo: UserInfo, completion: @escaping (Result<FirebaseAuth.User, WorkshopError>) -> Void) {
        DispatchQueue.main.async {
            Auth.auth().signIn(withEmail: userInfo.email, password: userInfo.password) { result, error in
                if let error = error {
                    print("DEBUG: Login failed \(error.localizedDescription)")
                    completion(.failure(.couldntLogin))
                    return
                }
                guard let user = result?.user else { return }
                completion(.success(user))
            }
        }
    }
    
    func register(with userInfo: UserInfo, completion: @escaping (Result<FirebaseAuth.User, WorkshopError>) -> Void) {
        DispatchQueue.main.async {
            Auth.auth().createUser(withEmail: userInfo.email, password: userInfo.password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    completion(.failure(.couldntRegister))
                    return
                }
                
                guard let user = result?.user else { return }
                print("Successfully registered user...")
                
                let data = [
                    "email": userInfo.email,
                    "username": userInfo.username,
                    "fullname": userInfo.fullname,
                    "uid": user.uid
                ]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("Successfully uploaded user data...")
                    completion(.success(user))
                }
            }
        }
    }
    
    func resetPassword(for email: String, completion: @escaping (Result<WorkshopSuccess, WorkshopError>) -> Void) {
        DispatchQueue.main.async {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error = error {
                    print("Failed to send link with error: \(error.localizedDescription)")
                    completion(.failure(.couldntResetPassword))
                    return
                } else {
                    completion(.success(.emailSent))
                }
            }
        }
    }
    
    
}
