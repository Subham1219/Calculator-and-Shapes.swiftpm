import SwiftUI

struct CalculatorButtonGrid: View {
    @Binding var currentInput: String
    @Binding var firstOperand: String
    @Binding var selectedOperator: CalculatorButton?
    
    let buttonRows: [[CalculatorButton]] = [
        [.clear, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(buttonRows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { button in
                        CalculatorButtonView(
                            button: button,
                            currentInput: $currentInput,
                            firstOperand: $firstOperand,
                            selectedOperator: $selectedOperator
                        )
                    }
                }
            }
        }
    }
}
