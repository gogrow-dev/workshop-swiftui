//
//  RegistrationView.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        LoadingView(viewModel.isLoading) {
            VStack {
                RegisterTextFields()
                WorkshopButton(text: "Register") {
                    viewModel.register()
                }
                Spacer()
                
            }.padding(.top)
        }.navigationBarTitleDisplayMode(.inline)
        .alert(item: $viewModel.workshopError) { alert in
            showErrorContent(for: alert)
        }
    }
    
    
    private struct RegisterTextFields: View {
        @EnvironmentObject var viewModel: AuthViewModel
        var body: some View {
            VStack(spacing: 20) {
                CustomLoginTextField(text: $viewModel.userInfo.username, placeholder: Text("Username"))
                CustomLoginTextField(text: $viewModel.userInfo.email, placeholder: Text("Email Address"))
                CustomLoginSecureField(text: $viewModel.userInfo.password, placeholder: Text("Password"))
            }
            .padding(20)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
