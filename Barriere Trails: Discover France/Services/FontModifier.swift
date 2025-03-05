import SwiftUI
import UIKit

struct FontModifier: ViewModifier {
    
    let fontModel: FontModel

    func body(content: Content) -> some View {
        content
            .font(SwiftUI.Font(fontModel.font))
    }
}

extension View {
    
    func fontSystem(_ fontModel: FontModel) -> some View {
        modifier(FontModifier(fontModel: fontModel))
    }
}

struct FontModel {
    
    let font: UIFont
    
    fileprivate init(font: UIFont) {
        self.font = font
    }
}

extension FontModel {
    
    static let title: FontModel = .init(font: UIFont(name: "Arvo-Bold", size: 16)!)
    static let text: FontModel = .init(font: UIFont(name: "Arvo", size: 15)!)
    static let main: FontModel = .init(font: UIFont(name: "Arvo-Bold", size: 15)!)
}
