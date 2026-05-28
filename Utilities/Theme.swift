import SwiftUI

enum Theme {
    static let primaryColor = Color.blue
    static let cornerRadius: CGFloat = 14
    static let spacing: CGFloat = 20

    static func primaryButtonStyle() -> some ViewModifier {
        PrimaryButtonModifier()
    }
}

struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(Theme.primaryColor)
            .foregroundColor(.white)
            .cornerRadius(Theme.cornerRadius)
    }
}
