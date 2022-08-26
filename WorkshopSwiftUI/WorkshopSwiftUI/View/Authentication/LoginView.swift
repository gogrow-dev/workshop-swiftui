//
//  LoginView.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 24/08/2022.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
            LoadingView(viewModel.isLoading) {
                VStack {
                    loginTextFields
                    WorkshopButton(text: "Sign in") {
                        viewModel.login()
                    }
                    Spacer()
                    GoToRegisterButton()
                }
            }
            .alert(item: $viewModel.workshopError) { alert in
                showErrorContent(for: alert)
            }
        }
    }
    
    
    private var loginTextFields: some View {
        VStack(spacing: 20) {
            CustomLoginTextField(text: $viewModel.userInfo.email, placeholder: Text("Email Address"))
            CustomLoginSecureField(text: $viewModel.userInfo.password, placeholder: Text("Password"))
            ForgotPasswordButton()
        }
        .padding(20)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthViewModel())
    }
}


// MARK: - Login Buttons

extension LoginView {
    
    struct GoToRegisterButton: View {
        var body: some View {
            NavigationLink(
                destination: RegistrationView()) {
                    HStack {
                        Text("Don't have an account?")
                            .font(.system(size: 14))
                        Text("Sign Up")
                            .font(.system(size: 14, weight: .semibold))
                    }
                }
        }
    }
    
    struct ForgotPasswordButton: View {
        var body: some View {
            HStack {
                Spacer()
                NavigationLink(destination: ResetPasswordView()) {
                    Text("Forgot Password?")
                        .font(.system(size: 13, weight: .semibold))
                        .padding(.trailing, 28)
                }
            }
        }
    }
}
