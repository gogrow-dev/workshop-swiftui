//
//  MainTabView.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 24/08/2022.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    let user: User
    var body: some View {
        TabView {
            UserListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView(user: user)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user: User.default)
    }
}
