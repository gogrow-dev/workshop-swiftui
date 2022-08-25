//
//  AuthViewModel.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 24/08/2022.
//

import Foundation
import Firebase

struct UserInfo {
    var fullname = ""
    var username = ""
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
    
    func register() {
        isLoading = true
        dataService.register(with: userInfo) { [weak self] result in
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
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        isLoading = true
        dataService.resetPassword(for: userInfo.email) { [weak self] result in
            switch result {
            case .success(let success):
                self?.isLoading = false
                self?.workshopSuccess = success
            case .failure(let error):
                self?.isLoading = false
                self?.workshopError = error
            }
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
}
