//
//  CustomLoginTextField.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import SwiftUI

struct CustomLoginTextField: View {
    
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        VStack(alignment: .leading) {
            placeholder
                .padding(.leading, 8)
            TextField("", text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
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
}


struct CustomLoginTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoginTextField(text: .constant(""), placeholder: Text("Email"))
    }
}
