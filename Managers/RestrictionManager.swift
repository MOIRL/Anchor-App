import Foundation
import Combine
import SwiftUI
import FamilyControls
import ManagedSettings
import DeviceActivity

class RestrictionManager: ObservableObject {
    
    static let shared = RestrictionManager()
    
    private let store = ManagedSettingsStore()
    
    @Published var isRestricted = false
    
    func requestAuthorization() {
        Task {
            do {
                try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
                print("Authorization approved")
            } catch {
                print("Authorization failed")
            }
        }
    }
    
    func activateRestrictions() {
        isRestricted = true
        print("Restrictions activated")
    }
    
    func deactivateRestrictions() {
        isRestricted = false
        store.clearAllSettings()
        print("Restrictions removed")
    }
}
