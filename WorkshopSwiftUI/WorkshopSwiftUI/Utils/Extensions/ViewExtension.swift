//
//  ViewExtension.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import SwiftUI

extension View {
    
    func showErrorContent(for error: WorkshopError) -> Alert {
        switch error {
        case .failedToFetchUser:
            return K.ErrorAlerts.failedToFetchUser
        case .couldntLogin:
            return K.ErrorAlerts.couldntLogin
        case .couldntFetchUsers:
            return K.ErrorAlerts.couldntFetchUsers
        case .couldntResetPassword:
            return K.ErrorAlerts.couldntResetPassword
        default:
            return K.ErrorAlerts.cannotExecuteRequest
        }
    }
    
    func showSuccessContent(for message: WorkshopSuccess, onDismiss: @escaping () -> Void) -> Alert {
        switch message {
        case .emailSent:
            return K.SuccessAlerts.emailSent(action: onDismiss)
        case .registrationComplete:
            return K.SuccessAlerts.registrationComplete(action: onDismiss)
//        default:
//            return K.Alerts.cannotExecuteRequest
        }
    }

    
    
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
            if condition {
                transform(self)
            } else {
                self
            }
        }
}

func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}


// MARK: - View Modifiers
// https://developer.apple.com/forums/thread/652827

extension View {
    @ViewBuilder
    func hiddenListRowSeparator() -> some View {
        if #available(iOS 15, *) {
            self.listRowSeparator(.hidden)
        }
    }
    
    @ViewBuilder
    func mediumDynamicTypeSize() -> some View {
        if #available(iOS 15, *) {
            self.dynamicTypeSize(.medium)
        }
    }
}
