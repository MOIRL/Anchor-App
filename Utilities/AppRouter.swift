import Foundation
import SwiftUI
import Combine

class AppRouter: ObservableObject {
    static let shared = AppRouter()

    @Published var hasCompletedOnboarding = false
    @Published var shouldShowPaywall = false

    func completeOnboarding() {
        hasCompletedOnboarding = true
    }

    func showPaywall() {
        shouldShowPaywall = true
    }

    func hidePaywall() {
        shouldShowPaywall = false
    }
}
