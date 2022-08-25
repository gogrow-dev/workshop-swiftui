//
//  LoadingView.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import SwiftUI

struct LoadingView<T>: View where T: View {
    var isLoading: Bool
    var backgroundColor: Color
    var content: () -> T
    
    init(_ isLoading: Bool, backgroundColor: Color = .black, @ViewBuilder content: @escaping () -> T) {
        self.isLoading = isLoading
        self.content = content
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        ZStack {
            content()
            if isLoading {
                backgroundColor
                    .opacity(0.25)
                    .ignoresSafeArea()
                ProgressView()
                    .font(.title2)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .cornerRadius(10)
                
            }
        }
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(true) {
            Text("Hello, world!")
        }
    }
}

