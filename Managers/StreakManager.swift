import Foundation
import SwiftUI
import Combine

class StreakManager: ObservableObject {
    
    @Published var currentStreak: Int = 0
    @Published var trustScore: Int = 100
    
    func increaseStreak() {
        currentStreak += 1
    }
    
    func resetStreak() {
        currentStreak = 0
        reduceTrustScore()
    }
    
    func reduceTrustScore() {
        if trustScore >= 10 {
            trustScore -= 10
        }
    }
}
