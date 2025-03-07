import SwiftUI

struct BookRow: View {
    
    let model: BookingInfo
    
    var body: some View {
        HStack(alignment: .top) {
            Image(model.place.id)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(30)
            VStack(alignment: .leading, spacing: 4) {
                Text(model.place.name)
                    .multilineTextAlignment(.leading)
                    .fontSystem(.title)
                    .foregroundStyle(.accent)
                Spacer()
                Text("Info:")
                    .fontSystem(.main)
                    .foregroundStyle(.disable)
                Text(model.email)
                    .fontSystem(.text)
                    .foregroundStyle(.disable)
                Text("\(model.startDate.formatted(date: .numeric, time: .omitted)) - \(model.endDate.formatted(date: .numeric, time: .omitted))")
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .fontSystem(.text)
                    .foregroundStyle(.disable)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 12)
    }
}

