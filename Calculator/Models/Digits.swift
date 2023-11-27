//
//  Digits.swift
//  Calculator
//
//

import Foundation

enum Digits: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}
