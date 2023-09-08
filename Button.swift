import SwiftUI
struct CalculatorButton: View {
    
    let text: String
    let color: Color
    let action: () -> Void
    
    init(_ text: String, _ color: Color = .white, action: @escaping () -> Void = {}) {
        self.text = text
        self.color = color
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(text)
                .font(.largeTitle)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(color)
                .foregroundColor(.black)
        }
    }
}
