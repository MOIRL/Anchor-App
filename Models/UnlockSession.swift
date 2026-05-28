import Foundation

struct UnlockSession: Identifiable, Codable {
    let id: String
    let userId: String
    let appName: String
    let durationMinutes: Int
    let approvedByGuardianId: String?
    let startedAt: Date
    let expiresAt: Date
    var isActive: Bool

    var hasExpired: Bool {
        Date() >= expiresAt
    }
}
