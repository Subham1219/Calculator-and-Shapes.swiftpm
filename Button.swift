import SwiftUI
struct CalculatorButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 24))
                .frame(width: 80, height: 80)
                .background(Color.orange)
                .foregroundColor(.black)
                .cornerRadius(40)
        }
    }
}

