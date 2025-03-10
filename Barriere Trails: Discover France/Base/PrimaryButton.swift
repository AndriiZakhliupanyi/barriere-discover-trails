import SwiftUI

struct PrimaryButton: ButtonStyle {
    
    func color(isPressed: Bool) -> Color {
        isPressed ? Color.accent.opacity(0.3) : Color.accent
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .multilineTextAlignment(.center)
            .fontSystem(.main)
            .foregroundStyle(Color.background)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .frame(height: 50)
            .background(color(isPressed: configuration.isPressed))
            .cornerRadius(20)
    }
}

extension Button {
    
    var primary: some View {
        buttonStyle(PrimaryButton())
    }
}
