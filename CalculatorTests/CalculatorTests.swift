//
//  CalculatorTests.swift
//  CalculatorTests
//
//

import XCTest

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    var calculator: Calculator!

    override func setUpWithError() throws {
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }
    
    func testDigitZeroInput() throws {
        calculator.setDigit(.zero)
        XCTAssertEqual(calculator.displayText, "0")
    }
    
    func testDigitOneInput() throws {
        calculator.setDigit(.one)
        XCTAssertEqual(calculator.displayText, "1")
    }
    
    func testDigitFiveInput() throws {
        calculator.setDigit(.five)
        XCTAssertEqual(calculator.displayText, "5")
    }

    func testMutiDigitInput() throws {
        calculator.setDigit(.one)
        calculator.setDigit(.two)
        calculator.setDigit(.zero)
        calculator.setDigit(.five)
        calculator.setDigit(.one)
        calculator.setDigit(.two)
        calculator.setDigit(.nine)
        XCTAssertEqual(calculator.displayText, "1,205,129")
    }

    func testAdditionResultCalculation() throws {
        calculator.setDigit(.one)
        calculator.setOperation(.addition)
        calculator.setDigit(.two)
        calculator.evaluate()
        XCTAssertEqual(calculator.displayText, "3")
    }
    
    func testSubtractionResultCalculation() throws {
        calculator.setDigit(.nine)
        calculator.setOperation(.subtraction)
        calculator.setDigit(.two)
        calculator.evaluate()
        XCTAssertEqual(calculator.displayText, "7")
    }
    
    func testMultiplicationResultCalculation() throws {
        calculator.setDigit(.five)
        calculator.setOperation(.multiplication)
        calculator.setDigit(.two)
        calculator.evaluate()
        XCTAssertEqual(calculator.displayText, "10")
    }
    
    func testDivisionResultCalculation() throws {
        calculator.setDigit(.one)
        calculator.setDigit(.zero)
        calculator.setOperation(.division)
        calculator.setDigit(.two)
        calculator.evaluate()
        XCTAssertEqual(calculator.displayText, "5")
    }
    
    func testAllClearOperation() throws {
        calculator.setDigit(.one)
        calculator.setOperation(.multiplication)
        calculator.setDigit(.two)
        calculator.allClear()
        XCTAssertEqual(calculator.displayText, "0")
    }
    
    func testClearOperation() throws {
        calculator.setDigit(.three)
        calculator.setOperation(.multiplication)
        calculator.setDigit(.two)
        calculator.clear()
        calculator.setDigit(.five)
        calculator.evaluate()
        XCTAssertEqual(calculator.displayText, "15")
    }
    
    
    func testDecimalPointInput1() throws {
        calculator.setDigit(.one)
        calculator.setDecimalPoint()
        calculator.setDigit(.zero)
        XCTAssertEqual(calculator.displayText, "1.0")
    }
    
    func testDecimalPointInput2() throws {
        calculator.setDigit(.three)
        calculator.setDecimalPoint()
        calculator.setDigit(.zero)
        calculator.setDigit(.one)
        calculator.setDigit(.zero)
        calculator.setDigit(.zero)
        calculator.setDigit(.two)
        XCTAssertEqual(calculator.displayText, "3.01002")
    }
    
    func testNegativeNumber() throws {
        calculator.setDigit(.one)
        calculator.plusOrMinusSign()
        XCTAssertEqual(calculator.displayText, "-1")
    }
    
    func testNumberPrecision() throws {
        calculator.setDigit(.nine)
        calculator.setOperation(.multiplication)
        calculator.setDigit(.nine)
        calculator.setOperation(.multiplication)
        calculator.setDigit(.nine)
        calculator.setOperation(.multiplication)
        calculator.setDigit(.nine)
        calculator.setOperation(.multiplication)
        calculator.setDigit(.nine)
        calculator.setOperation(.multiplication)
        calculator.setDigit(.nine)
        calculator.setOperation(.multiplication)
        calculator.setDigit(.nine)
        calculator.setOperation(.multiplication)
        calculator.setDigit(.nine)
        calculator.evaluate()
        XCTAssertEqual(calculator.displayText, "43,046,721")
    }
    
}
