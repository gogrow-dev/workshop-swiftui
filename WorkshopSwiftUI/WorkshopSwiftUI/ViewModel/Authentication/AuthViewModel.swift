//
//  AuthViewModel.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 24/08/2022.
//

import Foundation
import Firebase

struct UserInfo {
    var name = ""
    var email = ""
    var password = ""
    var repeatPassword = ""
}

class AuthViewModel: ObservableObject {
    @Published var userInfo = UserInfo()
    @Published var currentUser: User?
    
    @Published var isLoading = false
    @Published var workshopError: WorkshopError?
    @Published var workshopSuccess: WorkshopSuccess?
    
    @Published var userSession: FirebaseAuth.User?
    
    let dataService: AuthDataService
    
    init(dataService: AuthDataService = WorkshopAuthDataService()) {
        self.dataService = dataService
    }
    
    func login() {
        isLoading = true
        dataService.login(with: userInfo) { [weak self] result in
            switch result {
            case .success(let user):
                self?.isLoading = false
                self?.userSession = user
                self?.fetchUser()
            case .failure(let error):
                self?.isLoading = false
                self?.workshopError = error
            }
        }
    }
    
    func logout() {
        
    }
    
    func forgotPassword() {
        
    }
    
    func register() {
        
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
}
