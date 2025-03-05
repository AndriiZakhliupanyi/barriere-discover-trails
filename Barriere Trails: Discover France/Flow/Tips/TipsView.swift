import SwiftUI

struct TipsView: View {
    
    @StateObject var viewModel: TipsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                ForEach(viewModel.tips) { item in
                    TipRow(item: item)
                }
            }
            .padding(.vertical, 12)
        }
        .navigationTitle("Travel tips")
    }
}

struct TipsView_Previews: PreviewProvider {
    
    static var previews: some View {
        TipsView(
            viewModel: .init(
                router: TipsView.TipsRouter(navigationService: NavigationService())
            )
        )
    }
}
