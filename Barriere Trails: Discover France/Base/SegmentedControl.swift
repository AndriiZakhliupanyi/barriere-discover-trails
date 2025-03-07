import SwiftUI

struct SegmentedControl: View {
    
    @State private var itemSizes: [CGSize] = []
    @Binding private var currentItem: String
    
    private let items: [String]

    init(currentItem: Binding<String>, items: [String]) {
        self._currentItem = currentItem
        self.items = items
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(items.indexedItems, id: \.element) { index, item in
                Button {
                    currentItem = item
                } label: {
                    Text(item)
                        .fontSystem(item == currentItem ? .main : .text)
                        .foregroundStyle(item == currentItem ? .accent : .disable)
                        .frame(height: 40)
                        .padding(.horizontal, 20)
                        .contentShape(.rect)
                }
                .sizeReader($itemSizes[safe: index])
            }
        }
        .background(alignment: .leading) {
            if let offsetIndex = items.firstIndex(of: currentItem) {
                Color.white.opacity(0.1)
                    .frame(height: 40)
                    .frame(width: itemSizes[safe: offsetIndex]?.width ?? 0)
                    .cornerRadius(20)
                    .offset(x: itemSizes.prefix(offsetIndex).map(\.width).sum)
            }
        }
        .padding(1)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .inset(by: 1)
                .stroke(Color.accent, lineWidth: 2)
        )
        .animation(.easeInOut(duration: 0.2), value: currentItem)
        .onAppear {
            itemSizes = Array(repeating: .zero, count: items.count)
        }
    }
}
