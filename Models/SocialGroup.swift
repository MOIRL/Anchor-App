import Foundation

struct SocialGroup: Identifiable, Codable {
    let id: String
    var name: String
    var ownerId: String
    var memberIds: [String]
    var requiredApprovals: Int
    var createdAt: Date
}
