//
//  RegistrationView.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import SwiftUI

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        LoadingView(viewModel.isLoading) {
            VStack {
                registerTextFields
                registerButton
                Spacer()
                
                GoToLoginButton
            }
        }.navigationBarBackButtonHidden(true)
        .alert(item: $viewModel.boilerplateError) { alert in
            showErrorContent(for: alert)
        }
        .alert(item: $viewModel.boilerplateSuccess) { alert in
            showSuccessContent(for: alert, onDismiss: {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    
    private var registerTextFields: some View {
        VStack(spacing: 20) {
            CustomLoginTextField(text: $viewModel.userInfo.name, placeholder: Text("Full Name"))
            CustomLoginTextField(text: $viewModel.userInfo.email, placeholder: Text("Email Address"))
            CustomLoginSecureField(text: $viewModel.userInfo.password, placeholder: Text("Password"))
            CustomLoginSecureField(text: $viewModel.userInfo.repeatPassword, placeholder: Text("Repeat Password"))
        }
        .padding(20)
    }
    
    private var registerButton: some View {
        WorkshopButton(text: "Register") {
            viewModel.register()
        }
    }
}

extension RegistrationView {
    var GoToLoginButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Text("Already have an account?")
                    .font(.system(size: 14))
                Text("Sign In")
                    .font(.system(size: 14, weight: .semibold))
            }
        }
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
