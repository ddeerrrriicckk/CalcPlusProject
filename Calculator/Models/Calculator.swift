//
//  Calculator.swift
//  Calculator
//
//

import Foundation

struct Calculator {
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    private var insertMinusSign: Bool = false
    private var existsDecimalPoint: Bool = false
    private var zeroCount: Int = 0
    private var currentClear: Bool = false

    private var newNumber: Decimal? {
        didSet {
            guard newNumber != nil else { return }
            insertMinusSign = false
            existsDecimalPoint = false
            currentClear = false
            zeroCount = 0
        }
    }

    var displayText: String {
        return getNumConvertStr(for: number, with: true)
    }


    private func getNumConvertStr(for number: Decimal?, with: Bool = false) -> String {
        var numConvertStr = (with ? number?.formatted(.number) : number.map(String.init)) ?? "0"

        if insertMinusSign {
            numConvertStr.insert("-", at: numConvertStr.startIndex)
        }

        if existsDecimalPoint {
            numConvertStr.insert(".", at: numConvertStr.endIndex)
        }

        if zeroCount > 0 {
            numConvertStr.append(String(repeating: "0", count: zeroCount))
        }

        return numConvertStr
    }

    private var number: Decimal? {
        if currentClear || existsDecimalPoint {
            return newNumber
        }
        return newNumber ?? expression?.number ?? result
    }

    private func allowAddDigit(_ digit: Digits) -> Bool {
        if let num = number {
            if num != 0 || digit != .zero {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }

    mutating func setDigit(_ digit: Digits) {
        if checkDecimalPoint && digit == .zero {
            zeroCount += 1
        } else if allowAddDigit(digit) {
            let numConvertStr = getNumConvertStr(for: newNumber)
            newNumber = Decimal(string: numConvertStr.appending("\(digit.rawValue)"))
        }
    }

    // The chained of multiplication/division expression is not yet complete.
    private struct ArithmeticExpression: Equatable {
        var number: Decimal
        var operation: ArithmeticOperations

        func evaluate(with secondNumber: Decimal) -> Decimal {
            switch operation {
                case .addition:
                    return number + secondNumber
                case .subtraction:
                    return number - secondNumber
                case .multiplication:
                    return number * secondNumber
                case .division:
                    return number / secondNumber
            }
        }
    }

    mutating func setOperation(_ operation: ArithmeticOperations) {
        guard var number = newNumber ?? result else { return }

        if let existingExpression = expression {
            number = existingExpression.evaluate(with: number)
        }

        expression = ArithmeticExpression(number: number, operation: operation)
        newNumber = nil
    }

    func highlightOperation(_ operation: ArithmeticOperations) -> Bool {
        return expression?.operation == operation && newNumber == nil
    }

    // toggle plus or minus sign
    mutating func plusOrMinusSign() {
        if let number = newNumber {
            newNumber = -number
            return
        }

        if let number = result {
            result = -number
            return
        }

        insertMinusSign.toggle()
    }

    mutating func setPercent() {
        if let number = newNumber {
            newNumber = number / 100
            return
        }
        if let number = result {
            result = number / 100
            return
        }
    }

    private var checkDecimalPoint: Bool {
        return getNumConvertStr(for: number).contains(".")
    }

    mutating func setDecimalPoint() {
        if checkDecimalPoint {
            return
        }

        existsDecimalPoint = true
    }

    mutating func evaluate() {
        guard let number = newNumber, let expressionToEvaluate = expression else { return }
        result = expressionToEvaluate.evaluate(with: number)
        expression = nil
        newNumber = nil
    }

    // toggle Clear or AllClear
    var toggleClearSign: Bool {
        newNumber == nil && expression == nil && result == nil || currentClear
    }

    mutating func allClear() {
        insertMinusSign = false
        existsDecimalPoint = false
        zeroCount = 0
        newNumber = nil
        expression = nil
        result = nil
    }

    mutating func clear() {
        insertMinusSign = false
        existsDecimalPoint = false
        currentClear = true
        zeroCount = 0
        newNumber = nil
    }
}
