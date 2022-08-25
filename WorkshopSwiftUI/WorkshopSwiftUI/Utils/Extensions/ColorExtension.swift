//
//  ColorExtension.swift
//  WorkshopSwiftUI
//
//  Created by Nicolas Cobelo on 25/08/2022.
//

import SwiftUI

extension Color {
    
    init(hex: String) {
            let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int: UInt64 = 0
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
            }

            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue:  Double(b) / 255,
                opacity: Double(a) / 255
            )
        }
    
//    static let boilerplateLightGreen: Color = Color(hex: "B7B4A2")
//    static let boilerplateGreen: Color = Color(hex: "808274")
//    static let boilerplateWhite: Color = Color(hex: "F4EEED")
//    static let boilerplatePink: Color = Color(hex: "DFC1B8")
//    static let boilerplateBrown: Color = Color(hex: "C79A96")
//    static let boilerplateBlack: Color = Color(hex: "42373A")
//    
//    
//    static var gradientBackground: some View {
//        LinearGradient(gradient: Gradient(colors: [.boilerplateBrown, .boilerplatePink]), startPoint: .top, endPoint: .bottom)
//    }
}
