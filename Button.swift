import SwiftUI

enum CalculatorButton: String {
    case clear, plusMinus, percent
    case divide, multiply, subtract, add, equal
    case decimal
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var title: String {
        return rawValue
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.systemGray4)
        case .clear, .plusMinus, .percent:
            return Color(.systemGray)
        case .divide, .multiply, .subtract, .add, .equal:
            return Color(.orange)
        }
    }
}
