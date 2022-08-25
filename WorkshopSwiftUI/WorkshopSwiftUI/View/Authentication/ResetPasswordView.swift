//
//  ResetPasswordView.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        LoadingView(viewModel.isLoading){
            VStack(spacing: 30) {
                Text("Forgot your password?")
                    .font(.title)
                Text("Enter your email address and we'll send you an email so you can recover your password.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                CustomLoginTextField(text: $viewModel.userInfo.email, placeholder: Text("Email Address"))
                Spacer()
                WorkshopButton(text: "Send") {
                    viewModel.forgotPassword()
                }
                
            }.padding()
        }
        .alert(item: $viewModel.workshopError) { alert in
            showErrorContent(for: alert)
        }
        .alert(item: $viewModel.workshopSuccess) { alert in
            showSuccessContent(for: alert, onDismiss: {
                presentationMode.wrappedValue.dismiss()
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                    }
                }
            }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
