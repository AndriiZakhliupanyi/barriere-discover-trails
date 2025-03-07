import SwiftUI

struct BookingDetailsView: View {
    
    @StateObject var viewModel: BookingDetailsViewModel
    @State private var showCancelAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Button {
                viewModel.openDetails(place: viewModel.model.place)
            } label: {
                ItemRow(place: viewModel.model.place)
            }
            Button("Start navigation", action: viewModel.openMap)
                .secondary
            Text("Info:")
                .fontSystem(.main)
                .foregroundStyle(.disable)
            HStack {
                Text("Email:")
                    .fontSystem(.main)
                    .foregroundStyle(.disable)
                Spacer()
                Text(viewModel.model.email)
                    .fontSystem(.text)
                    .foregroundStyle(.accent)
            }
            HStack {
                Text("Start date:")
                    .fontSystem(.main)
                    .foregroundStyle(.disable)
                Spacer()
                Text(viewModel.model.startDate.formatted(date: .long, time: .omitted))
                    .fontSystem(.text)
                    .foregroundStyle(.accent)
            }
            HStack {
                Text("End date:")
                    .fontSystem(.main)
                    .foregroundStyle(.disable)
                Spacer()
                Text(viewModel.model.endDate.formatted(date: .long, time: .omitted))
                    .fontSystem(.text)
                    .foregroundStyle(.accent)
            }
            Spacer()
            Button("Cancel booking") {
                showCancelAlert = true
            }
            .destruct
        }
        .padding(12)
        .alert("Are you sure?", isPresented: $showCancelAlert) {
            Button("No", role: .cancel) { }
            Button("Yes, cancel", role: .destructive) {
                viewModel.cancelBooking()
            }
        }
        .navigationTitle("Booking details")
    }
}
