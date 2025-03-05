import SwiftUI

struct PrimaryButton: ButtonStyle {
    
    func color(isPressed: Bool) -> Color {
        isPressed ? Color.accent.opacity(0.3) : Color.accent
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontSystem(.main)
            .foregroundStyle(color(isPressed: configuration.isPressed))
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .frame(height: 40)
            .background(Color.background)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .inset(by: 1)
                    .stroke(color(isPressed: configuration.isPressed), lineWidth: 2)
            )
            .cornerRadius(20)
    }
}

extension Button {
    
    var primary: some View {
        buttonStyle(PrimaryButton())
    }
}
