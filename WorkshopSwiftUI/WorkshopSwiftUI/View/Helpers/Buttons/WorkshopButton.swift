//
//  WorkshopButton.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import SwiftUI

struct WorkshopButton: View {
    
    var text: String
    var textColor: Color = .white
    var buttonColor: Color = .blue
    var width: CGFloat = 229
    var height: CGFloat = 45
    var font: Font = .body
    var action: () -> Void
    
    var body: some View {
        
        Button(action: self.action) {
            ZStack {
                Capsule()
                    .stroke(lineWidth: 3)
                    .frame(width: width, height: height)
                    .foregroundColor(buttonColor)
                Capsule()
                    .frame(width: width, height: height)
                    .foregroundColor(buttonColor)
                Text(self.text)
                    .font(font)
                    .foregroundColor(textColor)
            }
        }
        
    }
}

struct WorkshopButton_Previews: PreviewProvider {
    static var previews: some View {
        WorkshopButton(text: "Log in", action: { print("hello, world!")})
    }
}
