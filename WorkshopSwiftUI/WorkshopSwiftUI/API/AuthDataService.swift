//
//  AuthDataService.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 24/08/2022.
//

import Foundation

protocol AuthDataService {
    func login(with userInfo: UserInfo, completion: @escaping (Result<User, WorkshopError>) -> Void)
    func logout(completion: @escaping (Result<Any, WorkshopError>) -> Void)
    func getProfile(from token: String, completion: @escaping (Result<User, WorkshopError>) -> Void)
    
    func register(with userInfo: UserInfo, completion: @escaping (Result<WorkshopSuccess, WorkshopError>) -> Void)
    func forgotPassword(for email: String, completion: @escaping (Result<WorkshopSuccess, WorkshopError>) -> Void)
}

class WorkshopAuthDataService: AuthDataService {
    func logout(completion: @escaping (Result<Any, WorkshopError>) -> Void) {
        
    }
    
    func login(with userInfo: UserInfo, completion: @escaping (Result<User, WorkshopError>) -> Void) {
        
    }
    
    func getProfile(from token: String, completion: @escaping (Result<User, WorkshopError>) -> Void) {
        
    }
    
    func register(with userInfo: UserInfo, completion: @escaping (Result<WorkshopSuccess, WorkshopError>) -> Void) {
        
    }
    
    func forgotPassword(for email: String, completion: @escaping (Result<WorkshopSuccess, WorkshopError>) -> Void) {
        
    }
    
    
}
