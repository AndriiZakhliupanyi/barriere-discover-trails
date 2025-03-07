import SwiftUI

struct BookingsView: View {
    
    @StateObject var viewModel: BookingsViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                if viewModel.items.isEmpty {
                    Text("Please book place first")
                        .fontSystem(.title)
                        .foregroundStyle(.accent)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 12)
                        .padding(.top, 32)
                }
                ForEach(viewModel.items) { item in
                    Button {
                        viewModel.openDetails(model: item)
                    } label: {
                        BookRow(model: item)
                    }
                }
            }
            .padding(.vertical, 12)
        }
        .onAppear {
            viewModel.reload()
        }
        .navigationTitle("Bookings")
    }
}

struct BookingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        BookingsView(
            viewModel: .init(
                router: BookingsView.BookingsRouter(navigationService: NavigationService())
            )
        )
    }
}
