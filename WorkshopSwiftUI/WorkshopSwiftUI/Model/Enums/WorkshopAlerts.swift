//
//  WorkshopAlerts.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 24/08/2022.
//

import Foundation

enum WorkshopError: Error, Identifiable {
    case failedToFetchUser
    case couldntLogin
    case couldntLogout
    case cannotExecuteRequest
    case couldntFetchUsers
    case couldntRegister
    case couldntUploadImage
    case couldntResetPassword
    case couldntUpdateProfile
    
    var id: Int { self.hashValue }
}

enum WorkshopSuccess: Identifiable {
    case emailSent
    case registrationComplete
    
    var id: Int { self.hashValue }
}
