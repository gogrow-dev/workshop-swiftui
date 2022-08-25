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
            Text(user.fullname)
        }
        .confirmationDialog("Logout", isPresented: $showSettings) {
            Button("Logout") { authViewModel.logout() }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if user.isCurrentUser {
                    Button(action: {
                        showSettings.toggle()
                    }) {
                        Image(systemName: "ellipsis")
                            .rotationEffect(Angle(degrees: 90))
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.default)
    }
}
