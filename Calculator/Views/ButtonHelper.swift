//
//  ButtonHelper.swift
//  Calculator
//
//  Created by Junqiao on 1/26/23.
//

import Foundation
import SwiftUI

extension CalculatorView {
    struct ButtonHelper: View {
        
        let buttonType: ButtonType
        @EnvironmentObject private var viewModel: ViewModel
        
        let lightMode: Bool
        var body: some View {
            Button(buttonType.description) {
                viewModel.executeAction(for: buttonType)
            }
                .buttonStyle(CustomButtonStyle(
                    size: getButtonSize(),
                    
                    backgroundColor: getBackgroundColor(),
                    foregroundColor: getForegroundColor(),
                    
                    buttonWide: buttonType == .digits(.zero),
                    lightMode: lightMode)
                )
        }
        
        private func getButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4.0
            let spacingCount = buttonCount + 1.0
            return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
        }
        
        private func getBackgroundColor() -> Color {
            return viewModel.highlighOperationButton(buttonType: buttonType) ? (lightMode ? buttonType.foregroundColorLight : buttonType.foregroundColor) : (lightMode ? buttonType.backgroundColorLight : buttonType.backgroundColor)
        }

        private func getForegroundColor() -> Color {
            return viewModel.highlighOperationButton(buttonType: buttonType) ? (lightMode ? buttonType.backgroundColorLight : buttonType.backgroundColor) : (lightMode ? buttonType.foregroundColorLight : buttonType.foregroundColor)
        }
    }
}

struct CalculatorView_ButtonHelper_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView().environmentObject(CalculatorView.ViewModel())
    }
}
