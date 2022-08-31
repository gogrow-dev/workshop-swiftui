//
//  ProfileView.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showSettings = false
    let user: User
    var body: some View {
        VStack {
            Spacer()
            Text(user.username)
            Spacer()
            if authViewModel.isCurrentUser() {
                WorkshopButton(text: "Sign out", buttonColor: .red) {
                    authViewModel.logout()
                }
            }
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.default)
    }
}
