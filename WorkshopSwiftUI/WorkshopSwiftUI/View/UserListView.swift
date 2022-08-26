//
//  UserListView.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel()
    var body: some View {
        NavigationView {
            LoadingView(viewModel.isLoading) {
                List(viewModel.users) { user in
                    NavigationLink {
                        ProfileView(user: user)
                    } label: {
                        UserRow(user: user)
                    }.listRowBackground(Color.clear)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Users")
        }
        
    }
}

struct UserRow: View {
    let user: User
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.fullname)
                .font(.body)
            Text(user.email)
                .font(.caption)
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
