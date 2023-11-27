//
//  ButtonType.swift
//  Calculator
//
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible  {
    // Arithmetic operations
//    case addition
//    case subtraction
//    case multiplication
//    case division
    
    // Other operations
    case allClear
    case clear
    case negative
    case percent
    case decimalPoint
    case equals
    case operations(_ operations: ArithmeticOperations)
    
    // Digits
//    case zero
//    case one
//    case two
//    case three
//    case four
//    case five
//    case six
//    case seven
//    case eight
//    case nine
    case digits(_ digits: Digits)
    
    var description: String {
        switch self {
            case .allClear:
                return "AC"
            case .clear:
                return "C"
            case .negative:
                return "+/-"
            case .percent:
                return "%"
            case .decimalPoint:
                return "."
            case .equals:
                return "="
            case .digits(let digits):
                return digits.description
            case .operations(let operations):
                return operations.description
        }
    }
    
    var backgroundColor: Color {
        switch self {
            case .allClear, .clear, .negative, .percent:
                return Color(red: 0.306, green: 0.314, blue: 0.373)
            case .operations, .equals:
                return Color(red: 0.294, green: 0.369, blue: 0.988)
            case .digits, .decimalPoint:
                return .secondary
        }
    }
    
    var backgroundColorLight: Color {
        switch self {
            case .allClear, .clear, .negative, .percent:
                return Color(red: 0.824, green: 0.827, blue: 0.855)
            case .operations, .equals:
                return Color(red: 0.294, green: 0.369, blue: 0.988)
            case .digits, .decimalPoint:
                return Color(red: 1, green: 1, blue: 1)
        }
    }
    
    var foregroundColor: Color {
        switch self {
            default:
                return .white
        }
    }
    
    var foregroundColorLight: Color {
        switch self {
            default:
                return .black
        }
    }
}
