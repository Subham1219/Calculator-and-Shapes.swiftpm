import SwiftUI

struct CalculatorButtonView: View {
    let button: CalculatorButton
    @Binding var currentInput: String
    @Binding var firstOperand: String
    @Binding var selectedOperator: CalculatorButton?
    
    var body: some View {
        Button(action: {
            handleButtonTap()
        }) {
            Text(button.title)
                .font(.title)
                .frame(width: buttonWidth(), height: buttonHeight())
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .cornerRadius(buttonWidth() / 2)
        }
    }
    
    private func handleButtonTap() {
        switch button {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            if currentInput == "0" || shouldClearInput() {
                currentInput = button.title
            } else {
                currentInput += button.title
            }
        case .clear:
            currentInput = "0"
            firstOperand = ""
            selectedOperator = nil
        case .plusMinus:
            if currentInput != "0" {
                if currentInput.starts(with: "-") {
                    currentInput.remove(at: currentInput.startIndex)
                } else {
                    currentInput = "-" + currentInput
                }
            }
        case .percent:
            if let value = Double(currentInput) {
                currentInput = String(value / 100)
            }
        case .divide, .multiply, .subtract, .add:
            if firstOperand.isEmpty {
                firstOperand = currentInput
                currentInput = ""
            }
            selectedOperator = button
        case .equal:
            if !firstOperand.isEmpty && selectedOperator != nil {
                performCalculation()
            }
        }
    }
    
    private func shouldClearInput() -> Bool {
        return currentInput == "0" || currentInput.isEmpty || currentInput == "-" || currentInput == "-0"
    }
    
    private func performCalculation() {
        if let firstValue = Double(firstOperand), let secondValue = Double(currentInput) {
            var result: Double = 0
            switch selectedOperator {
            case .divide:
                if secondValue != 0 {
                    result = firstValue / secondValue
                } else {
                    currentInput = "Error"
                    return
                }
            case .multiply:
                result = firstValue * secondValue
            case .subtract:
                result = firstValue - secondValue
            case .add:
                result = firstValue + secondValue
            default:
                break
            }
            
            currentInput = String(result)
            firstOperand = ""
            selectedOperator = nil
        }
    }
    
    private func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 10) / 4
    }
    
    private func buttonHeight() -> CGFloat {
        return buttonWidth()
    }
}
