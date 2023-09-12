import SwiftUI

struct ContentView: View {
    @State private var currentInput = ""
    @State private var firstOperand = ""
    @State private var selectedOperator: CalculatorButton?
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            Text(currentInput)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
            
            CalculatorButtonGrid(
                currentInput: $currentInput,
                firstOperand: $firstOperand,
                selectedOperator: $selectedOperator
            )
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
