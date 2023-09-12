import SwiftUI

enum CalculatorButton: String {
    case clear = "AC", plusMinus = "+/-", percent = "%"
    case divide = "÷", multiply = "×", subtract = "−", add = "+", equal = "="
    case decimal = "."
    case zero = "0", one = "1", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9"
    
    var title: String {
        return rawValue
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.darkGray)
        case .clear, .plusMinus, .percent:
            return Color(.lightGray)
        case .divide, .multiply, .subtract, .add, .equal:
            return Color(.orange)
        }
    }
}




