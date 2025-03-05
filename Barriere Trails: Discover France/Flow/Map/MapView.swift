import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var viewModel: MapViewModel
    @State var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: viewModel.items) { place in
            MapAnnotation(coordinate: place.coordinate) {
                Button {
                    viewModel.openDetails(place: place)
                } label: {
                    Image("location")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.accent)
                }
            }
        }
        .onAppear {
            region.center = .init(latitude: 46.8945382289811, longitude: 1.9367010698592697)
            region.span = MKCoordinateSpan(latitudeDelta: 8, longitudeDelta: 8)
        }
        .navigationTitle("Map")
    }
}

struct MapView_Previews: PreviewProvider {
    
    static var previews: some View {
        MapView(
            viewModel: .init(
                router: MapView.MapRouter(navigationService: NavigationService())
            )
        )
    }
}
