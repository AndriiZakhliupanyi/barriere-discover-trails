import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel: ListViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                SegmentedControl(currentItem: $viewModel.filterCurrentItem, items: viewModel.filterItems)
                    .padding(.bottom, 12)
                if viewModel.items.isEmpty && viewModel.filterCurrentItem == viewModel.filterItems[safe: 1] {
                    Text("Please add your favorite locations")
                        .fontSystem(.title)
                        .foregroundStyle(.accent)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 12)
                        .padding(.top, 32)
                }
                ForEach(viewModel.items) { item in
                    Button {
                        viewModel.openDetails(place: item)
                    } label: {
                        ItemRow(place: item)
                    }
                }
            }
            .padding(.vertical, 12)
        }
        .onAppear {
            viewModel.reloadFavoriteIds()
        }
        .navigationTitle("Places")
    }
}

struct ListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ListView(
            viewModel: .init(
                router: ListView.ListRouter(navigationService: NavigationService())
            )
        )
    }
}
