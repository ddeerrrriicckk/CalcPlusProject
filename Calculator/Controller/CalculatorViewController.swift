//
//  CalculatorViewController.swift
//  Calculator
//
//

import Foundation

import Combine

extension CalculatorView {
    final class ViewModel: ObservableObject {
        
        @Published private var calculator = Calculator()
        
        var displayText: String {
            return calculator.displayText
        }
        
        var buttonTypes: [[ButtonType]] {
            let clearType: ButtonType = calculator.toggleClearSign ? .allClear : .clear
            
            return [[clearType, .negative, .percent, .operations(.division)],
                    [.digits(.seven), .digits(.eight), .digits(.nine), .operations(.multiplication)],
                    [.digits(.four), .digits(.five), .digits(.six), .operations(.subtraction)],
                    [.digits(.one), .digits(.two), .digits(.three), .operations(.addition)],
                    [.digits(.zero), .decimalPoint, .equals]]
        }
        
        func executeAction(for buttonType: ButtonType) {
            switch buttonType {
            case .digits(let digit):
                calculator.setDigit(digit)
            case .operations(let operation):
                calculator.setOperation(operation)
            case .negative:
                calculator.plusOrMinusSign()
            case .percent:
                calculator.setPercent()
            case .decimalPoint:
                calculator.setDecimalPoint()
            case .equals:
                calculator.evaluate()
            case .allClear:
                calculator.allClear()
            case .clear:
                calculator.clear()
            }
        }
        
        func highlighOperationButton(buttonType: ButtonType) -> Bool {
            guard case .operations(let operation) = buttonType else { return false}
            return calculator.highlightOperation(operation)
        }
    }
}
