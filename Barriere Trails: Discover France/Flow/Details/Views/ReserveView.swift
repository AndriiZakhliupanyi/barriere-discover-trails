import SwiftUI

struct ReserveView: View {
    
    @State private var startDate: Date
    @State private var endDate: Date
    @State private var email: String
    
    @State private var showErrorAlert: Bool = false
    @State private var showSuccessAlert: Bool = false
    
    @Environment(\.presentationMode) private var presentationMode
    
    private let place: Place
    
    init(place: Place) {
        self.place = place
        self.startDate = .now.add(.day, value: 1)
        self.endDate = .now.add(.day, value: 2)
        self.email = Storage.shared.email
    }
    
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.all)
            if #available(iOS 16.0, *) {
                content
                    .presentationDetents([.height(320)])
                    .presentationDragIndicator(.visible)
            } else {
                content
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Enter your email:")
                .fontSystem(.title)
                .foregroundStyle(.accent)
            ZStack {
                Color.white.opacity(0.1)
                TextField("Email", text: $email, prompt: Text("Email:").foregroundColor(.disable))
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .foregroundStyle(.accent)
                    .fontSystem(.text)
                    .padding(.horizontal, 12)
            }
            .frame(height: 40)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .inset(by: 1)
                    .stroke(Color.accent, lineWidth: 2)
            )
            .cornerRadius(20)
            Text("Attention! We will contact you for confirmation via email.")
                .fontSystem(.subtext)
                .foregroundStyle(.disable)
            Color.accent.frame(height: 1)
            DatePicker("Start Date", selection: $startDate, in: .now..., displayedComponents: .date)
                .foregroundStyle(.accent)
                .accentColor(.accent)
                .colorScheme(.dark)
                .fontSystem(.text)
            DatePicker("End Date", selection: $endDate, in: startDate.add(.day, value: 1)..., displayedComponents: .date)
                .foregroundStyle(.accent)
                .accentColor(.accent)
                .colorScheme(.dark)
                .fontSystem(.text)
            Button("Submit", action: submit)
                .primary
        }
        .padding(12)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Close") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .alert("Please enter a valid email", isPresented: $showErrorAlert) {
            Button("OK", role: .cancel) { }
        }
        .alert("Thank you! We have booked it and will contact you!", isPresented: $showSuccessAlert) {
            Button("OK", role: .cancel) {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    func submit() {
        if email.isValidEmail {
            showSuccessAlert = true
            var bookings = Storage.shared.bookings
            bookings.append(.init(place: place, email: email, startDate: startDate, endDate: endDate))
            Storage.shared.bookings = bookings
            Storage.shared.email = email
        } else {
            showErrorAlert = true
        }
    }
}
