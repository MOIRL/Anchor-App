import Foundation

struct FocusChallenge: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let targetApp: String
    let durationDays: Int
    var currentDay: Int
    var isCompleted: Bool
    let createdByUserId: String
    let participantIds: [String]
}
