import Foundation
import Combine

class UnlockSessionManager: ObservableObject {
    static let shared = UnlockSessionManager()

    @Published var activeSessions: [UnlockSession] = []

    func startSession(userId: String, appName: String, durationMinutes: Int, approvedByGuardianId: String?) {
        let now = Date()
        let session = UnlockSession(
            id: UUID().uuidString,
            userId: userId,
            appName: appName,
            durationMinutes: durationMinutes,
            approvedByGuardianId: approvedByGuardianId,
            startedAt: now,
            expiresAt: Calendar.current.date(byAdding: .minute, value: durationMinutes, to: now) ?? now,
            isActive: true
        )

        activeSessions.append(session)
    }

    func endExpiredSessions() {
        activeSessions = activeSessions.map { session in
            var updatedSession = session
            if session.hasExpired {
                updatedSession.isActive = false
            }
            return updatedSession
        }
    }

    func isUnlocked(appName: String) -> Bool {
        endExpiredSessions()
        return activeSessions.contains { $0.appName == appName && $0.isActive && !$0.hasExpired }
    }
}
