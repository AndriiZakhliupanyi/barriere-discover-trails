import SwiftUI

struct SizeReader: ViewModifier {
    
    @Binding var size: CGSize

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy -> Color in
                    DispatchQueue.main.async {
                        if proxy.size != size {
                            size = proxy.size
                        }
                    }
                    return Color.clear
                }
            )
    }
}

extension View {
    
    @ViewBuilder
    func sizeReader(_ size: Binding<CGSize>?) -> some View {
        if let size {
            modifier(SizeReader(size: size))
        } else {
            self
        }
    }
}
