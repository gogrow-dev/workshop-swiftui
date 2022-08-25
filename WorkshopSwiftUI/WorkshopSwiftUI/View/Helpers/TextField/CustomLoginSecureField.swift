//
//  CustomLoginSecureField.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import SwiftUI

struct CustomLoginSecureField: View {
    @Binding var text: String
    let placeholder: Text
    @State var isShowingPassword = false
    
    var body: some View {
        VStack(alignment: .leading) {
            placeholder
                .padding(.leading, 8)
            HStack {
                Group {
                    if isShowingPassword {
                       TextField("", text: $text)
                            .autocapitalization(.none)
                    } else {
                        SecureField("", text: $text)
                            .autocapitalization(.none)
                    }
                }
                Button(action: {
                    isShowingPassword.toggle()
                }) {
                    Image(systemName: getEyeImage())
                        .foregroundColor(.black)
                }
            }
            .padding()
            .background(
                ZStack {
                    Capsule()
                        .stroke(lineWidth: 1)
                        .foregroundColor(.black.opacity(0.5))
                        
                    Capsule()
                        .foregroundColor(.gray.opacity(0.2))
                }
            )
                
        }
        
    }
    
    func getEyeImage() -> String {
        isShowingPassword ? "eye.slash" : "eye"
    }
}


struct CustomLoginSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoginSecureField(text: .constant(""), placeholder: Text("Password"))
    }
}
