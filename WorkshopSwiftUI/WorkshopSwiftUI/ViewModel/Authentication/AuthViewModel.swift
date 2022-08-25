//
//  AuthViewModel.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 24/08/2022.
//

import Foundation

struct UserInfo {
    var name = ""
    var email = ""
    var password = ""
    var repeatPassword = ""
}

class AuthViewModel: ObservableObject {
    @Published var userSession: User?
    @Published var boilerplateError: WorkshopError?
    @Published var boilerplateSuccess: WorkshopSuccess?
    
    let dataService: AuthDataService
    
    init(dataService: AuthDataService = WorkshopAuthDataService()) {
        self.dataService = dataService
    }
    
    func login() {
        
    }
    
    func logout() {
        
    }
    
    func forgotPassword() {
        
    }
    
    func register() {
        
    }
}
