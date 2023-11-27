//
//  CustomButtonStyle.swift
//  Calculator
//
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    var buttonWide: Bool = false
    var lightMode: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 38, weight: .medium))
            .frame(width: size, height: size)
            .frame(maxWidth: buttonWide ? .infinity : size, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay {
                if configuration.isPressed {
                    lightMode ? Color(white: 0.01, opacity: 0.3) : Color(white: 1.0, opacity: 0.3)
                }
            }
            .cornerRadius(24)
    }
}


struct CustomButtonStyle_Previews: PreviewProvider {
    static let buttonType: ButtonType = .digits(.zero)
    
    static var previews: some View {
        Button(buttonType.description) {}
            .buttonStyle(CustomButtonStyle(
                size: 90,
                backgroundColor: buttonType.backgroundColor,
                foregroundColor: buttonType.foregroundColor,
                buttonWide: buttonType == .digits(.zero),
                lightMode: false)
            )
    }
}
