//
//  ContentView.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 24/08/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if viewModel.userSession != nil {
            MainTabView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
