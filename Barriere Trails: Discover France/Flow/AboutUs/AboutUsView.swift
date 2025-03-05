import SwiftUI

struct AboutUsView: View {
    
    @StateObject var viewModel: AboutUsViewModel
    
    var body: some View {
        ScrollView {
            Text("Our app helps travelers discover the best luxury hotels across France. Whether visiting Paris, Bordeaux, the French Riviera, or the Alps, we provide a selection of high-quality accommodations. Each hotel is chosen for its unique charm, excellent service, and beautiful surroundings.\n\nThe app offers detailed descriptions, images, and essential information to make it easier to find the right place to stay. From elegant city hotels to quiet countryside retreats, there are options for every type of traveler.\n\nUsers can explore different locations, learn about available amenities, and plan their stay with ease. Whether looking for relaxation, fine dining, or cultural experiences, the app helps make every trip special.")
                .fontSystem(.text)
                .foregroundStyle(.accent)
                .padding(12)
        }
        .navigationTitle("About Us")
    }
}

struct AboutUsView_Previews: PreviewProvider {
    
    static var previews: some View {
        AboutUsView(
            viewModel: .init(
                router: AboutUsView.AboutUsRouter(navigationService: NavigationService())
            )
        )
    }
}
