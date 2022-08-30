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
            VStack {
                LoginTextFields()
                WorkshopButton(text: "Sign in") {
                    print("User is trying to sign in")
                }
                Spacer()
                GoToRegisterButton()
            }.padding(.top).navigationBarHidden(true)
            .alert(item: $viewModel.workshopError) { alert in
                showErrorContent(for: alert)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthViewModel())
    }
}


// MARK: - Login Buttons

extension LoginView {
    
    private struct LoginTextFields: View {
        @EnvironmentObject var viewModel: AuthViewModel
        var body: some View {
            VStack(spacing: 20) {
                CustomLoginTextField(text: $viewModel.userInfo.email, placeholder: Text("Email Address"))
                CustomLoginSecureField(text: $viewModel.userInfo.password, placeholder: Text("Password"))
                ForgotPasswordButton()
            }
            .padding(20)
        }
    }
    
    private struct GoToRegisterButton: View {
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
    
    private struct ForgotPasswordButton: View {
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
