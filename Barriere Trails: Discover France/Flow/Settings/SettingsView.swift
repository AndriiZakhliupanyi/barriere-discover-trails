import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel: SettingsViewModel
    
    @State private var showClearCacheAlert = false
    @State private var showFeedbackAlert = false
    @State private var showResultFeedbackAlert = false
    
    @State private var feedbackText: String = ""
    
    var body: some View {
        VStack(spacing: 12) {
            Image("topImage")
                .resizable()
                .frame(height: UIScreen.main.bounds.width / 2)
            Button(viewModel.isPlaying ? "Sound: on" : "Sound: off", action: viewModel.changeSound)
                .primary
                .padding(.horizontal, 12)
            Button("About Us", action: viewModel.openAboutUs)
                .primary
                .padding(.horizontal, 12)
            Button("Write feedback") {
                showFeedbackAlert = true
            }
            .primary
            .padding(.horizontal, 12)
            Button("Clear cache") {
                viewModel.clearCache()
                showClearCacheAlert = true
            }
            .primary
            .padding(.horizontal, 12)
            Spacer()
        }
        .padding(.bottom, 12)
        .alert("Success", isPresented: $showClearCacheAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Your cache cleared")
        }
        .alert("Write feedback", isPresented: $showFeedbackAlert) {
            TextField("Enter Your Feedback", text: $feedbackText) {}
                .fontSystem(.text)
            Button("Submit") {
                feedbackText = ""
                showResultFeedbackAlert = true
            }
        }
        .alert("Success", isPresented: $showResultFeedbackAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Feedback saved")
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView(
            viewModel: .init(
                router: SettingsView.SettingsRouter(navigationService: NavigationService())
            )
        )
    }
}
