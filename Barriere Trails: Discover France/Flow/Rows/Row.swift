import SwiftUI

struct Row: View {
    
    let place: Place
    
    var body: some View {
        HStack(alignment: .top) {
            Image(place.id)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(30)
            VStack(alignment: .leading, spacing: 4) {
                Text(place.name)
                    .multilineTextAlignment(.leading)
                    .fontSystem(.title)
                Text(place.description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .fontSystem(.text)
            }
            .foregroundStyle(.accent)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 12)
    }
}

