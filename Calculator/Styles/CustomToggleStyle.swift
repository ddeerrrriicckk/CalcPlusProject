//
//  CustomToggleStyle.swift
//  Calculator
//
//

import Foundation
import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Rectangle()
            .frame(width: 75, height: 35)
            .foregroundColor(configuration.isOn ? Color(red: 1, green: 1, blue: 1) : Color(red: 0.180, green: 0.184, blue: 0.220) )
            .clipShape(Capsule())
            .overlay(
                ZStack{
                    Circle()
                        .foregroundColor(configuration.isOn ? Color(red: 0.824, green: 0.827, blue: 0.855) : Color(red: 0.306, green: 0.314, blue: 0.373))
                        .padding(.all, 3)
                        .offset(x: configuration.isOn ? 20 : -20, y: 0)
                        .animation(Animation.linear(duration: 0.1))
                    
                    Image(systemName: configuration.isOn ? "sun.max.fill" : "moon.fill")
                        .foregroundColor(Color.blue)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                        .offset(x: configuration.isOn ? -20 : 20)
                }
            )
            .onTapGesture {
                configuration.isOn.toggle()
            }
    }
}


struct CustomToggleStyleExamplePreview : View {
    @State private var lightMode: Bool = false
     var body: some View {
         Toggle(isOn: $lightMode) {
         }
         .padding()
         .toggleStyle(CustomToggleStyle())
     }
}

struct CustomToggleStyle_Previews: PreviewProvider {
    @State private var darkMode: Bool = true
    static var previews: some View {
        CustomToggleStyleExamplePreview()
    }
}

