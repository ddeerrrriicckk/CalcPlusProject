# CalcPlusProject: A _Simple_ Calculator

## Introduction

CalcPlusProject extends the foundational UI challenge of CalcProject to create a fully functioning calculator app for iOS. This project builds upon the responsive design principles and incorporates the logic necessary to perform basic arithmetic operations, demonstrating both aesthetic UI design and practical functionality.

## Installation
### Prerequisites

- Xcode 14 or newer
- iOS 16 or newer for testing on a device

### Running the Project

To run this project, follow these steps:

```bash
git clone https://github.com/ddeerrrriicckk/CalcPlusProject.git
cd CalcPlusProject
open Calculator.xcodeproj
```

## Overview

CalcPlusProject enhances the responsive layout of CalcProject with operational capabilities. It's a fully functional app capable of constructing multi-digit numbers, performing basic calculations, and managing user interactions.

## Objectives

- Integrate a responsive UI with functional arithmetic operations.
- Implement a user-friendly interface for a standard iOS calculator app.
- Maintain adaptability and intuitive interaction principles.

## Required Functionality

- Constructing multi-digit numbers from user input.
- Performing basic arithmetic operations (addition, subtraction, multiplication, division).
- Displaying immediate results.
- Resetting the calculator to its initial state.

## Project Structure

The CalcPlusProject is composed of several key components, each serving a distinct role within the application:

#### `CalculatorViewController.swift`

Manages the view layer of the calculator, handling user inputs and updating the display. Uses Combine for data binding and SwiftUI for UI representation.


#### Key Features

- **ObservableObject ViewModel**: Manages the calculator's state, updating the view upon changes.
- **Published Properties**: Automatically updates the view with `@Published` properties.
- **ButtonType Handling**: Defines a button grid, each associated with functions like digits and operations.
- **Action Execution**: The `executeAction(for:)` method interprets the user's button press and triggers the corresponding action in the `Calculator` model.

#### Example Code

This snippet from `CalculatorViewController.swift` shows how the ViewModel is structured:

```swift
extension CalculatorView {
    final class ViewModel: ObservableObject {
        
        @Published private var calculator = Calculator()
        
        // ... other properties and functions ...

        func executeAction(for buttonType: ButtonType) {
            switch buttonType {
            // Handling various button types and their actions
            }
        }

        // ... other methods ...
    }
}
```
In this example, the executeAction(for:) function demonstrates how user interactions with different button types are handled, triggering specific calculations or UI updates.

#### Implementation Highlights

- Combine Framework: Ensures UI remains in sync with the calculator's state.
- SwiftUI Integration: Enhances responsiveness and interactivity.

#### `Calculator.swift`

The `Calculator.swift` forms the backbone of the CalcPlusProject, handling all the computational logic and state management required for the calculator's operation. It encapsulates the core functionality that defines a calculator, managing the arithmetic operations, user inputs, and computation results.

#### Key Features
- **Core Computational Logic**: Centralizes all arithmetic operations and state changes. It processes user inputs, performs calculations, and manages the current state of the calculator.

- **State Management**: Maintains and updates the state of the calculator, including the current operation, the operands, and the result.

- **User Input Handling:** Interprets the user's input, converting button presses into meaningful actions like setting digits, choosing operations, and calculating results.

- **Decimal Handling**: Manages decimal points and zero inputs, ensuring accurate number representation and calculation.

- **Operation and Result Display**: Provides a mechanism to format and display the current operation and result in a user-friendly format.

#### Example Code
This snippet from `Calculator.swift` illustrates its role in handling the arithmetic logic and state:

``` swift
struct Calculator {
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    // ... Additional properties ...

    mutating func setDigit(_ digit: Digits) {
        // Implementation for setting a digit
    }

    mutating func setOperation(_ operation: ArithmeticOperations) {
        // Implementation for setting an operation
    }

    mutating func evaluate() {
        // Implementation for evaluating the expression
    }

    // ... Additional methods ...
}
```
#### Implementation Highlights
- **Modular Design**: The struct is designed with clear separation of concerns, encapsulating all arithmetic-related functionalities, making the codebase clean and maintainable.

- **Decimal Precision**: Utilizes the Decimal type for handling numerical operations, ensuring precision and avoiding common floating-point errors.

- **Complex State Handling**: Manages complex states, like toggling between different arithmetic operations and handling ongoing calculations, showcasing an advanced understanding of state management in Swift.

## Testing

The project includes a suite of unit tests found in CalculatorTests.swift that validate the functionality of arithmetic operations and UI responsiveness.

## Design and Implementation

The CalcPlusProject adopts a minimalist UI design, focusing on user-friendliness and responsive layout. It aligns with modern iOS standards, offering a clean, intuitive interface.


- Minimalist UI for clarity and focus.
- Responsive layout for consistent experience across iOS devices.
- Intuitive interaction mimicking common calculator interfaces.
- The project employs the MVVM pattern, enhancing code manageability and scalability.