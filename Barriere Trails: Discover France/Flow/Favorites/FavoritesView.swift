import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel: FavoritesViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                if viewModel.items.isEmpty {
                    Text("Please add your favorite locations")
                        .fontSystem(.title)
                        .foregroundStyle(.accent)
                        .padding(.horizontal, 12)
                        .padding(.top, 32)
                }
                ForEach(viewModel.items) { item in
                    Button {
                        viewModel.openDetails(place: item)
                    } label: {
                        Row(place: item)
                    }
                }
            }
            .padding(.vertical, 12)
        }
        .navigationTitle("Favorites")
        .onAppear {
            viewModel.reloadFavoriteIds()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    
    static var previews: some View {
        FavoritesView(
            viewModel: .init(
                router: FavoritesView.FavoritesRouter(navigationService: NavigationService())
            )
        )
    }
}
