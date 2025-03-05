import SwiftUI

struct TabItem {
    
    let title: String
    let icon: String
}

struct TabBarView<T: View>: View {
    
    let items: [TabItem]
    let views: [T]
    
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            views[selectedTab]
                .transition(.opacity)
            
            Color.black.opacity(0.1)
                .frame(height: 1)
            
            HStack {
                ForEach(0..<items.count, id: \.self) { index in
                    Spacer()
                    
                    Button(
                        action: {
                            withAnimation {
                                selectedTab = index
                            }
                        }
                    ) {
                        VStack {
                            Image(items[index].icon)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(selectedTab == index ? .accent : .white)
                            
                            Text(items[index].title)
                                .fontSystem(.text)
                                .foregroundColor(selectedTab == index ? .accent : .white)
                        }
                    }
                    
                    Spacer()
                }
            }
            .frame(height: 60)
            .background(Color.background)
        }
    }
}
