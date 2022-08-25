//
//  UserListViewModel.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var isLoading = false
    @Published var workshopError: WorkshopError?
    
    let dataService: UserDataService
    
    init(dataService: UserDataService = WorkshopUserDataService()) {
        self.dataService = dataService
        getUsers()
    }
    
    func getUsers() {
        isLoading = true
        dataService.getUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.isLoading = false
                self?.users = users
            case .failure(let error):
                self?.isLoading = false
                self?.workshopError = error
            }
        }
    }
}
