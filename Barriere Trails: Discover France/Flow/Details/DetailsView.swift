import SwiftUI
import MapKit

struct DetailsView: View {
    
    @StateObject var viewModel: DetailsViewModel
    @State var region = MKCoordinateRegion()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(spacing: -50) {
                    Map(coordinateRegion: $region, annotationItems: [viewModel.place]) { artwork in
                        MapMarker(coordinate: viewModel.place.coordinate)
                    }
                    .onAppear {
                        region.center = viewModel.place.coordinate
                        region.span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                    }
                    .frame(height: 300)
                    Image(viewModel.place.id)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(30)
                }
                Text(viewModel.place.description)
                    .foregroundStyle(.accent)
                    .fontSystem(.text)
                    .padding(.horizontal, 12)
            }
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
