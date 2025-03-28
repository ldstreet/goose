import SwiftUI

public struct GooseGreetingView: View {
    @State private var isAnimating = false
    @State private var honkScale = 1.0
    
    public init(isAnimating: Bool = false, honkScale: Double = 1.0) {
        self.isAnimating = isAnimating
        self.honkScale = honkScale
    }
    
    public var body: some View {
        ZStack {
            // Background gradient
            RadialGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.white]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Hello, Goose!")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .shadow(radius: 2)
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isAnimating)
                
                // Fun emoji with bounce effect
                Text("🦢")
                    .font(.system(size: 80))
                    .rotationEffect(.degrees(isAnimating ? 5 : -5))
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
                
                Button("HONK!") {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
                        honkScale = 1.5
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            honkScale = 1.0
                        }
                    }
                }
                .font(.headline.bold())
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                )
                .scaleEffect(honkScale)
                .shadow(radius: 5)
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    GooseGreetingView()
}
