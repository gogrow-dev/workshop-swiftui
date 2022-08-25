//
//  ErrorAlerts.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import SwiftUI

extension K {
    struct ErrorAlerts {
        static let failedToFetchUser = Alert(title: Text("Oops..."),
                                         message: Text("No se pudo obtener la información del usuario"),
                                         dismissButton: .default(Text("Ok")))
        static let couldntLogin = Alert(title: Text("Email o contraseña incorrectos"),
                                             message: Text("Por favor, intentelo nuevamente"),
                                             dismissButton: .default(Text("Ok")))
        static let cannotExecuteRequest = Alert(title: Text("Oops..."),
                                         message: Text("Algo anduvo mal. Por favor, intentelo nuevamente"),
                                         dismissButton: .default(Text("Ok")))
        static let couldntFetchUsers = Alert(title: Text("Oops..."),
                                             message: Text("No se pudo obtener el listado de usuarios"),
                                             dismissButton: .default(Text("Ok")))
        static let couldntResetPassword = Alert(title: Text("Oops..."),
                                             message: Text("No se pudo resetear la contraseña"),
                                             dismissButton: .default(Text("Ok")))
    }
    
    struct SuccessAlerts {
        static func emailSent(action: @escaping () -> Void) -> Alert {
            return Alert(title: Text(NSLocalizedString("Email enviado", comment: "")),
                         message: Text(NSLocalizedString("Se ha enviado un mail con su nueva contraseña a su correo", comment: "")),
                         dismissButton: .default(Text("Ok"), action: action))
        }
        
        static func registrationComplete(action: @escaping () -> Void) -> Alert {
            return Alert(title: Text(NSLocalizedString("Registro completado", comment: "")),
                         message: Text(NSLocalizedString("Se ha registrado correctamente", comment: "")),
                         dismissButton: .default(Text("Ok"), action: action))
        }
    }
}
