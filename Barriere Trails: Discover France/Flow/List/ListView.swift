import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel: ListViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.items) { item in
                    Button {
                        viewModel.openDetails(place: item)
                    } label: {
                        Row(place: item)
                    }
                }
            }
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
