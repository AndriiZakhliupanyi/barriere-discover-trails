import SwiftUI

private struct DebugFrame: ViewModifier {
    
    let color: Color

    func body(content: Content) -> some View {
        #if !DEBUG
            return content
        #endif
        
        content
            .overlay(
                GeometryReader { geometry in
                    let globalOrigin: CGPoint = geometry.frame(in: .global).origin
                    let origin: String = "(x: \(rounded(globalOrigin.x)), y: \(rounded(globalOrigin.y)))"
                    let size: String = "(w: \(rounded(geometry.size.width)), h: \(rounded(geometry.size.height)))"
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .foregroundColor(color)
                        Text("\(origin) | \(size)")
                            .font(.system(size: 10))
                            .foregroundColor(color)
                    }
                }
            )
    }
    
    private func rounded(_ value: CGFloat) -> Float {
        return Float(round(100 * value) / 100)
    }
}

extension View {
    
    func debugFrame(color: Color = .red) -> some View {
        return modifier(DebugFrame(color: color))
    }
}
