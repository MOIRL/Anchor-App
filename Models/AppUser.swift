import Foundation

struct AppUser: Identifiable, Codable {
    let id: String
    var name: String
    var email: String
    var streakCount: Int
    var trustScore: Int
}
