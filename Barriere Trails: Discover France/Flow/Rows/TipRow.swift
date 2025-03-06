import SwiftUI

struct TipRow: View {
    
    let item: Tip
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(item.name)
                .multilineTextAlignment(.leading)
                .fontSystem(.title)
            Text(item.description)
                .multilineTextAlignment(.leading)
                .fontSystem(.text)
        }
        .foregroundStyle(.accent)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 12)
    }
}
