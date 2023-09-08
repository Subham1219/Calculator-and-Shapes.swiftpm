import SwiftUI

enum CalculatorMode {
    case none, addition, subtraction, multiplication, division
}

struct ContentView: View {
    @State private var displayText = "0"
    @State private var currentInput = ""
    @State private var currentMode: CalculatorMode = .none
    @State private var storedValue = 0.0
    
    var body: some View {
        VStack {
            Text(displayText)
                .font(.largeTitle)
                .padding()
            
            HStack {
                CalculatorButton("7")
                CalculatorButton("8")
                CalculatorButton("9")
                CalculatorButton("÷", .orange, action: { self.operationButtonTapped(.division) })
            }
            
            HStack {
                CalculatorButton("4")
                CalculatorButton("5")
                CalculatorButton("6")
                CalculatorButton("×", .orange, action: { self.operationButtonTapped(.multiplication) })
            }
            
            HStack {
                CalculatorButton("1")
                CalculatorButton("2")
                CalculatorButton("3")
                CalculatorButton("-", .orange, action: { self.operationButtonTapped(.subtraction) })
            }
            
            HStack {
                CalculatorButton("0")
                CalculatorButton(".", .gray, action: { self.numberButtonTapped(".") })
                CalculatorButton("=", .orange, action: { self.equalButtonTapped() })
                CalculatorButton("+", .orange, action: { self.operationButtonTapped(.addition) })
            }
            
            Spacer()
            
            Button("Clear", action: { self.clearButtonTapped() })
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(10)
                .padding()
        }
    }
    
    func numberButtonTapped(_ number: String) {
        currentInput += number
        displayText = currentInput
    }
    
    func operationButtonTapped(_ mode: CalculatorMode) {
        if currentMode != .none {
            equalButtonTapped()
        }
        
        storedValue = Double(currentInput) ?? 0
        currentInput = ""
        currentMode = mode
    }
    
    func equalButtonTapped() {
        guard !currentInput.isEmpty else { return }
        
        let currentValue = Double(currentInput) ?? 0
        var result = 0.0
        
        switch currentMode {
        case .addition:
            result = storedValue + currentValue
        case .subtraction:
            result = storedValue - currentValue
        case .multiplication:
            result = storedValue * currentValue
        case .division:
            if currentValue != 0 {
                result = storedValue / currentValue
            } else {
                displayText = "Error"
                return
            }
        case .none:
            result = currentValue
        }
        
        currentInput = String(result)
        displayText = currentInput
        currentMode = .none
    }
    
    func clearButtonTapped() {
        currentInput = ""
        displayText = "0"
        currentMode = .none
        storedValue = 0
    }
}
