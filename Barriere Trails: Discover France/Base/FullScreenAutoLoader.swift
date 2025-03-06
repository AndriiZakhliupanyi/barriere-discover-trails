import SwiftUI
import Combine

struct FullScreenAutoLoaderModifier: ViewModifier {
    
    @State private var isLoading: Bool = true
    
    var appName: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isLoading {
                Color.background
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text(appName)
                        .fontSystem(.title)
                        .foregroundColor(.accent)
                        .padding(.horizontal, 20)
                    
                    LoadingFiveLinesPulse(color: .accent)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    isLoading = false
                }
            }
        }
    }
}

fileprivate struct LoadingFiveLinesPulse: View {
    
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    let timing: Double
    
    let maxCounter: Int = 5
    @State var counter = 0
    
    let frame: CGSize = .init(width: 70, height: 70)
    let primaryColor: Color
    
    init(color: Color) {
        timing = 0.25
        timer = Timer.publish(every: timing, on: .main, in: .common).autoconnect()
        primaryColor = color
    }
    
    var body: some View {
        HStack(spacing: frame.width / 10) {
            ForEach(0..<maxCounter) { index in
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(primaryColor)
                    .frame(maxHeight:
                            (index == 2) && (counter == 0) ? .infinity :
                            (index == 1 || index == 3) && (counter == 1) ? .infinity :
                            (index == 0 || index == 4) && (counter == 2) ? .infinity :
                            frame.height / 2
                    )
            }
        }
        .frame(width: frame.width, height: frame.height, alignment: .center)
        .onReceive(timer, perform: { _ in
            withAnimation(Animation.easeOut(duration: timing)) {
                counter = counter == 3 ? 0 : counter + 1
            }
        })
    }
}

extension View {
    
    func fullScreenAutoLoader() -> some View {
        self.modifier(FullScreenAutoLoaderModifier())
    }
}
