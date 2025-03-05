import SwiftUI

struct TabItem {
    
    let title: String
    let icon: String
    let view: AnyView
}

struct TabBarView: View {
    
    let items: [TabItem]
    
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                ForEach(0..<items.count, id: \.self) { index in
                    items[index].view
                        .applyIf(selectedTab != index) {
                            $0.hidden()
                        }
                }
            }
            
            Color.black.opacity(0.1)
                .frame(height: 1)
            
            HStack {
                ForEach(0..<items.count, id: \.self) { index in
                    Spacer()
                    
                    Button(
                        action: {
                            Task { @MainActor in
                                selectedTab = index
                            }
                        }
                    ) {
                        VStack {
                            Image(items[index].icon)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(selectedTab == index ? .accent : .disable)
                            
                            Text(items[index].title)
                                .fontSystem(.text)
                                .foregroundColor(selectedTab == index ? .accent : .disable)
                        }
                    }
                    
                    Spacer()
                }
            }
            .frame(height: 70)
            .background(Color.background)
        }
    }
}
