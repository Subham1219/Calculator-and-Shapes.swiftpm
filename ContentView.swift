import SwiftUI

enum CalculatorOperation {
    case none, addition, subtraction, multiplication, division
}

struct ContentView: View {
    @State private var currentInput = "0"
    @State private var previousInput = ""
    @State private var selectedOperation: CalculatorOperation = .none
    
    var body: some View {
        VStack(spacing: 10) {
            Text(currentInput)
                .font(.system(size: 60))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding()
            
            HStack(spacing: 10) {
                CalculatorButton(label: "7", action: { appendInput("7") })
                CalculatorButton(label: "8", action: { appendInput("8") })
                CalculatorButton(label: "9", action: { appendInput("9") })
                CalculatorButton(label: "÷", action: { setOperation(.division) })
                    
            }
            
            HStack(spacing: 10) {
                CalculatorButton(label: "4", action: { appendInput("4") })
                CalculatorButton(label: "5", action: { appendInput("5") })
                CalculatorButton(label: "6", action: { appendInput("6") })
                CalculatorButton(label: "×", action: { setOperation(.multiplication) })
            }
            
            HStack(spacing: 10) {
                CalculatorButton(label: "1", action: { appendInput("1") })
                CalculatorButton(label: "2", action: { appendInput("2") })
                CalculatorButton(label: "3", action: { appendInput("3") })
                CalculatorButton(label: "-", action: { setOperation(.subtraction) })
            }
            
            HStack(spacing: 10) {
                CalculatorButton(label: "0", action: { appendInput("0") })
                CalculatorButton(label: ".", action: { appendInput(".") })
                CalculatorButton(label: "=", action: { performOperation() })
                CalculatorButton(label: "+", action: { setOperation(.addition) })
            }
            
            CalculatorButton(label: "C", action: { clear() })
        }
        .padding()
    }
    
    func appendInput(_ input: String) {
        if currentInput == "0" || currentInput == "-0" {
            currentInput = input
        } else {
            currentInput += input
        }
    }
    
    func setOperation(_ operation: CalculatorOperation) {
        if selectedOperation == .none {
            previousInput = currentInput
            currentInput = "0"
        }
        selectedOperation = operation
    }
    
    func performOperation() {
        guard let currentValue = Double(currentInput),
              let previousValue = Double(previousInput) else { return }
        
        switch selectedOperation {
        case .addition:
            currentInput = String(previousValue + currentValue)
        case .subtraction:
            currentInput = String(previousValue - currentValue)
        case .multiplication:
            currentInput = String(previousValue * currentValue)
        case .division:
            if currentValue != 0 {
                currentInput = String(previousValue / currentValue)
            } else {
                currentInput = "Error"
            }
        case .none:
            break
        }
        
        selectedOperation = .none
    }
    
    func clear() {
        currentInput = "0"
        previousInput = ""
        selectedOperation = .none
    }
}
