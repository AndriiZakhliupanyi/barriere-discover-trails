import SwiftUI
import MapKit

struct DetailsView: View {
    
    @StateObject var viewModel: DetailsViewModel
    @State var region = MKCoordinateRegion()
    @State var showReserveSheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: -40) {
                    Map(coordinateRegion: $region, annotationItems: [viewModel.place]) { place in
                        MapAnnotation(coordinate: place.coordinate) {
                            Image("location")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundStyle(.accent)
                        }
                    }
                    .onAppear {
                        region.center = viewModel.place.coordinate
                        region.span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                    }
                    .frame(height: 300)
                    HStack(alignment: .bottom) {
                        Image(viewModel.place.id)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(30)
                        Spacer()
                        Button("Reserve") {
                            showReserveSheet = true
                        }
                        .primary
                    }
                    .padding(.horizontal, 12)
                }
                HStack(spacing: 12) {
                    Button(
                        viewModel.isFavorite ? "Remove from Favorites" : "Add to Favorites",
                        action: viewModel.changeFavorite
                    )
                    .secondary
                    Button("Start navigation", action: viewModel.openMap)
                        .secondary
                }
                .padding(.horizontal, 12)
                Text(viewModel.place.description)
                    .foregroundStyle(.accent)
                    .fontSystem(.text)
                    .padding(.horizontal, 12)
            }
            .padding(.bottom, 12)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: viewModel.openMap) {
                    Image("navigation")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
        }
        .sheet(isPresented: $showReserveSheet) {
            ReserveView(place: viewModel.place)
        }
        .navigationTitle(viewModel.place.name)
    }
}

struct DetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailsView(
            viewModel: .init(
                place: .init(id: "0", name: "", lat: 1, long: 1, description: ""),
                router: DetailsView.DetailsRouter(navigationService: NavigationService())
            )
        )
    }
}
